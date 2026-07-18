import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/env.dart';
import '../../../core/network/dio_client.dart';
import '../../../shared/models/place_models.dart';
import '../../../shared/services/places_service.dart';
import 'neighborhood_score_engine.dart';

final weatherServiceProvider =
    Provider((ref) => WeatherService(ref.watch(dioProvider)));

final exchangeRateServiceProvider =
    Provider((ref) => ExchangeRateService(ref.watch(dioProvider)));

final neighborhoodInsightProvider = FutureProvider.autoDispose
    .family<NeighborhoodInsight,
        ({double lat, double lng, String? label, String locale})>(
        (ref, args) async {
  final places = ref.watch(placesServiceProvider);
  const engine = NeighborhoodScoreEngine();
  final types = NeighborhoodScoreEngine.allPlaceTypes;

  final byType = <String, List<PlaceSummary>>{};
  await Future.wait(
    types.map((type) async {
      try {
        byType[type] = await places.nearbySearch(
          lat: args.lat,
          lng: args.lng,
          type: type,
          radiusMeters: 1500,
        );
      } catch (_) {
        byType[type] = [];
      }
    }),
  );

  final score = engine.compute(
    lat: args.lat,
    lng: args.lng,
    placesByType: byType,
    areaName: args.label,
  );

  WeatherSnapshot? weather;
  FxSnapshot? fx;
  try {
    weather = await ref.watch(weatherServiceProvider).current(
          lat: args.lat,
          lng: args.lng,
          language: args.locale,
        );
  } catch (_) {}
  try {
    fx = await ref.watch(exchangeRateServiceProvider).latest();
  } catch (_) {}

  return NeighborhoodInsight(score: score, weather: weather, fx: fx);
});

class NeighborhoodInsight {
  const NeighborhoodInsight({
    required this.score,
    this.weather,
    this.fx,
  });

  final NeighborhoodScoreResult score;
  final WeatherSnapshot? weather;
  final FxSnapshot? fx;
}

class WeatherSnapshot {
  const WeatherSnapshot({
    required this.tempC,
    required this.condition,
    required this.iconUrl,
    required this.feelsLikeC,
    required this.humidity,
  });

  final double tempC;
  final String condition;
  final String iconUrl;
  final double feelsLikeC;
  final int humidity;
}

class WeatherService {
  WeatherService(this._dio);
  final Dio _dio;

  Future<WeatherSnapshot> current({
    required double lat,
    required double lng,
    String language = 'en',
  }) async {
    final key = Env.weatherApiKey;
    if (key.isEmpty) {
      throw StateError('Weather API key missing');
    }
    final response = await _dio.get<Map<String, dynamic>>(
      'https://api.weatherapi.com/v1/current.json',
      queryParameters: {
        'key': key,
        'q': '$lat,$lng',
        'lang': language,
        'aqi': 'no',
      },
    );
    final current = response.data?['current'] as Map<String, dynamic>;
    final condition = current['condition'] as Map<String, dynamic>;
    final icon = condition['icon'] as String? ?? '';
    return WeatherSnapshot(
      tempC: (current['temp_c'] as num).toDouble(),
      condition: condition['text'] as String? ?? '',
      iconUrl: icon.startsWith('http') ? icon : 'https:$icon',
      feelsLikeC: (current['feelslike_c'] as num).toDouble(),
      humidity: (current['humidity'] as num).toInt(),
    );
  }
}

class FxSnapshot {
  const FxSnapshot({
    required this.base,
    required this.rates,
  });

  final String base;
  final Map<String, double> rates;
}

class ExchangeRateService {
  ExchangeRateService(this._dio);
  final Dio _dio;

  Future<FxSnapshot> latest({String base = 'USD'}) async {
    final key = Env.exchangeRateApiKey;
    if (key.isEmpty) {
      throw StateError('Exchange rate API key missing');
    }

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'https://v6.exchangerate-api.com/v6/$key/latest/$base',
      );
      final data = response.data;
      if (data != null && data['result'] != 'error') {
        final rates = (data['conversion_rates'] as Map<String, dynamic>? ?? {})
            .map((k, v) => MapEntry(k, (v as num).toDouble()));
        return FxSnapshot(base: base, rates: rates);
      }
    } catch (_) {}

    // Fallback: some keys are for open.er-api compatible hosts
    final fallback = await _dio.get<Map<String, dynamic>>(
      'https://open.er-api.com/v6/latest/$base',
      options: Options(
        headers: {if (key.isNotEmpty) 'Authorization': 'Bearer $key'},
      ),
    );
    final rates = (fallback.data?['rates'] as Map<String, dynamic>? ?? {})
        .map((k, v) => MapEntry(k, (v as num).toDouble()));
    return FxSnapshot(base: base, rates: rates);
  }
}
