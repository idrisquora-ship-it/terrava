import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env.dart';
import '../../core/config/user_preferences.dart';
import '../../core/constants/place_categories.dart';
import '../../core/network/dio_client.dart';
import '../models/place_models.dart';

class PlacesApiException implements Exception {
  PlacesApiException(this.status, [this.message]);

  final String status;
  final String? message;

  @override
  String toString() =>
      message == null || message!.isEmpty ? status : '$status: $message';
}

final placesServiceProvider = Provider<PlacesService>((ref) {
  final language = ref.watch(userPreferencesProvider.select((p) => p.locale));
  return PlacesService(ref.watch(dioProvider), language: language);
});

/// Location data facade: Mapbox (search/geo/directions) + Foursquare (POIs).
class PlacesService {
  PlacesService(this._dio, {required this.language});

  final Dio _dio;
  final String language;

  static const _mapbox = 'https://api.mapbox.com';
  // Current Foursquare Places API (Bearer service key).
  static const _fsq = 'https://places-api.foursquare.com/places';

  /// Photos are Premium on Foursquare; Pro tier returns no photo URLs.
  Map<String, String> get photoHeaders => const {};

  String photoUrl(String photoReference, {int maxWidth = 800}) {
    return photoReference;
  }

  Future<List<PlaceSummary>> nearbySearch({
    required double lat,
    required double lng,
    String? type,
    String? keyword,
    int radiusMeters = 1500,
  }) async {
    if (!Env.hasValidFoursquareConfig) {
      throw PlacesApiException(
        'CONFIG',
        'FOURSQUARE_API_KEY is missing. Add it to .env (see doc/MAPBOX_FOURSQUARE_SETUP.md).',
      );
    }

    final category = type == null ? null : categoryForTypeKey(type);
    final queryParameters = <String, dynamic>{
      'll': '$lat,$lng',
      'radius': radiusMeters.clamp(1, 100000),
      'limit': 50,
      if (category != null && category.fsqCategoryIds.isNotEmpty)
        'fsq_category_ids': category.fsqCategoryIds.join(','),
      if (keyword != null && keyword.trim().isNotEmpty) 'query': keyword.trim(),
      if (keyword == null &&
          category == null &&
          type != null &&
          type.trim().isNotEmpty)
        'query': type.replaceAll('_', ' '),
    };

    final response = await _dio.get<Map<String, dynamic>>(
      '$_fsq/search',
      queryParameters: queryParameters,
    );

    final results = response.data?['results'] as List<dynamic>? ?? [];
    return results
        .map((raw) => mapFoursquarePlaceSummary(raw as Map<String, dynamic>))
        .where((p) => p.placeId.isNotEmpty)
        .toList();
  }

  Future<List<PlaceSummary>> textSearch(
    String query, {
    double? lat,
    double? lng,
  }) async {
    if (!Env.hasValidFoursquareConfig) return [];
    final response = await _dio.get<Map<String, dynamic>>(
      '$_fsq/search',
      queryParameters: {
        'query': query,
        if (lat != null && lng != null) 'll': '$lat,$lng',
        if (lat != null && lng != null) 'radius': 50000,
        'limit': 20,
      },
    );
    final results = response.data?['results'] as List<dynamic>? ?? [];
    return results
        .map((raw) => mapFoursquarePlaceSummary(raw as Map<String, dynamic>))
        .where((p) => p.placeId.isNotEmpty)
        .toList();
  }

  Future<List<AutocompleteSuggestion>> autocomplete(String input) async {
    if (input.trim().length < 2) return [];
    if (!Env.hasValidMapboxConfig) {
      throw PlacesApiException(
        'CONFIG',
        'MAPBOX_ACCESS_TOKEN is missing. Add a pk.* token to .env.',
      );
    }

    final encoded = Uri.encodeComponent(input.trim());
    final response = await _dio.get<Map<String, dynamic>>(
      '$_mapbox/geocoding/v5/mapbox.places/$encoded.json',
      queryParameters: {
        'autocomplete': true,
        'limit': 8,
        'language': language,
      },
    );

    final features = response.data?['features'] as List<dynamic>? ?? [];
    return features.map((raw) {
      final map = raw as Map<String, dynamic>;
      final placeName = map['place_name'] as String? ?? '';
      final text = map['text'] as String? ?? placeName;
      final center = map['center'] as List<dynamic>?;
      final lng = center != null && center.isNotEmpty
          ? (center[0] as num).toDouble()
          : null;
      final lat = center != null && center.length > 1
          ? (center[1] as num).toDouble()
          : null;
      final types = (map['place_type'] as List<dynamic>? ?? [])
          .map((e) => '$e')
          .toList();
      final context = map['context'] as List<dynamic>?;
      String? secondary;
      if (placeName.contains(',')) {
        secondary = placeName.substring(placeName.indexOf(',') + 1).trim();
      } else if (context != null && context.isNotEmpty) {
        secondary = (context.first as Map)['text'] as String?;
      }

      return AutocompleteSuggestion(
        placeId: map['id'] as String? ?? placeName,
        description: placeName,
        mainText: text,
        secondaryText: secondary,
        lat: lat,
        lng: lng,
        isPoi: types.contains('poi'),
      );
    }).toList();
  }

  Future<PlaceDetails> placeDetails(String placeId) async {
    if (!Env.hasValidFoursquareConfig) {
      throw PlacesApiException('CONFIG', 'FOURSQUARE_API_KEY is missing.');
    }

    final response = await _dio.get<Map<String, dynamic>>(
      '$_fsq/$placeId',
    );
    final data = response.data;
    if (data == null) throw StateError('Place not found');
    return mapFoursquarePlaceDetails(data);
  }

  Future<({double lat, double lng, String? formattedAddress})?> geocode(
    String query,
  ) async {
    if (!Env.hasValidMapboxConfig) {
      throw PlacesApiException('CONFIG', 'MAPBOX_ACCESS_TOKEN is missing.');
    }
    final encoded = Uri.encodeComponent(query.trim());
    final response = await _dio.get<Map<String, dynamic>>(
      '$_mapbox/geocoding/v5/mapbox.places/$encoded.json',
      queryParameters: {
        'limit': 1,
        'language': language,
      },
    );
    final features = response.data?['features'] as List<dynamic>? ?? [];
    if (features.isEmpty) return null;
    final first = features.first as Map<String, dynamic>;
    final center = first['center'] as List<dynamic>;
    return (
      lng: (center[0] as num).toDouble(),
      lat: (center[1] as num).toDouble(),
      formattedAddress: first['place_name'] as String?,
    );
  }

  Future<({String? formattedAddress})?> reverseGeocode({
    required double lat,
    required double lng,
  }) async {
    if (!Env.hasValidMapboxConfig) {
      throw PlacesApiException('CONFIG', 'MAPBOX_ACCESS_TOKEN is missing.');
    }
    final response = await _dio.get<Map<String, dynamic>>(
      '$_mapbox/geocoding/v5/mapbox.places/$lng,$lat.json',
      queryParameters: {
        'limit': 1,
        'language': language,
      },
    );
    final features = response.data?['features'] as List<dynamic>? ?? [];
    if (features.isEmpty) return null;
    final first = features.first as Map<String, dynamic>;
    return (formattedAddress: first['place_name'] as String?);
  }

  Future<RouteDirections> directions({
    required double originLat,
    required double originLng,
    required double destLat,
    required double destLng,
  }) async {
    if (!Env.hasValidMapboxConfig) {
      throw PlacesApiException('CONFIG', 'MAPBOX_ACCESS_TOKEN is missing.');
    }

    final response = await _dio.get<Map<String, dynamic>>(
      '$_mapbox/directions/v5/mapbox/driving/'
      '$originLng,$originLat;$destLng,$destLat',
      queryParameters: {
        'geometries': 'geojson',
        'overview': 'full',
      },
    );

    final routes = response.data?['routes'] as List<dynamic>? ?? [];
    if (routes.isEmpty) {
      throw PlacesApiException('NO_ROUTE', 'No route found');
    }
    final route = routes.first as Map<String, dynamic>;
    final geometry = route['geometry'] as Map<String, dynamic>;
    final coords = geometry['coordinates'] as List<dynamic>? ?? [];
    final points = coords.map((c) {
      final pair = c as List<dynamic>;
      return (
        lng: (pair[0] as num).toDouble(),
        lat: (pair[1] as num).toDouble(),
      );
    }).toList();

    final distanceM = (route['distance'] as num?)?.toDouble() ?? 0;
    final durationS = (route['duration'] as num?)?.toDouble() ?? 0;

    return RouteDirections(
      points: points,
      distanceText: _formatDistance(distanceM),
      durationText: _formatDuration(durationS),
    );
  }

  String _formatDistance(double meters) {
    if (meters >= 1000) {
      return '${(meters / 1000).toStringAsFixed(1)} km';
    }
    return '${meters.round()} m';
  }

  String _formatDuration(double seconds) {
    final mins = (seconds / 60).round();
    if (mins < 60) return '$mins min';
    final h = mins ~/ 60;
    final m = mins % 60;
    return m == 0 ? '${h}h' : '${h}h ${m}m';
  }
}

/// Maps a Foursquare Places API place JSON object into [PlaceSummary].
PlaceSummary mapFoursquarePlaceSummary(Map<String, dynamic> map) {
  // New Places API returns top-level lat/lng; legacy used geocodes.main.
  final geocodes = map['geocodes'] as Map<String, dynamic>?;
  final main = geocodes?['main'] as Map<String, dynamic>?;
  final lat = (map['latitude'] as num?)?.toDouble() ??
      (main?['latitude'] as num?)?.toDouble();
  final lng = (map['longitude'] as num?)?.toDouble() ??
      (main?['longitude'] as num?)?.toDouble();

  final location = map['location'] as Map<String, dynamic>?;
  final categories = map['categories'] as List<dynamic>? ?? [];
  final types = categories
      .map((c) => (c as Map<String, dynamic>)['name'] as String? ?? '')
      .where((n) => n.isNotEmpty)
      .map((n) => n.toLowerCase().replaceAll(' ', '_'))
      .toList();

  final address = [
    location?['address'],
    location?['locality'],
    location?['region'],
  ].whereType<String>().where((s) => s.isNotEmpty).join(', ');

  return PlaceSummary(
    placeId: map['fsq_place_id'] as String? ??
        map['fsq_id'] as String? ??
        '',
    name: map['name'] as String? ?? 'Unknown',
    address: address.isEmpty ? null : address,
    lat: lat,
    lng: lng,
    types: types,
  );
}

/// Maps a Foursquare Places API place JSON object into [PlaceDetails].
PlaceDetails mapFoursquarePlaceDetails(Map<String, dynamic> map) {
  final summary = mapFoursquarePlaceSummary(map);
  final location = map['location'] as Map<String, dynamic>?;
  final formatted = location?['formatted_address'] as String?;
  final hours = map['hours'] as Map<String, dynamic>?;
  final openNow = hours?['open_now'] as bool?;
  final contacts = map['contacts'] as Map<String, dynamic>?;
  final phone = map['tel'] as String? ??
      map['phone'] as String? ??
      contacts?['phone'] as String? ??
      contacts?['formatted_phone'] as String?;
  final website = map['website'] as String? ??
      map['website_url'] as String?;

  return PlaceDetails(
    placeId: summary.placeId,
    name: summary.name,
    address: formatted ?? summary.address,
    lat: summary.lat,
    lng: summary.lng,
    types: summary.types,
    openNow: openNow,
    phone: phone,
    website: website,
    editorialSummary: map['description'] as String?,
  );
}
