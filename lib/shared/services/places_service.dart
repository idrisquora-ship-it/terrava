import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env.dart';
import '../../core/config/user_preferences.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/google_request_headers.dart';
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

class PlacesService {
  PlacesService(this._dio, {required this.language});

  final Dio _dio;
  final String language;
  static const _base = 'https://maps.googleapis.com/maps/api';

  String get _key => Env.googleMapsApiKey;

  /// Headers needed for Google photo URLs when the key is app-restricted.
  Map<String, String> get photoHeaders => googleApiRequestHeadersSync;

  /// Throws when Google returns an error status so the UI can show the
  /// real cause (e.g. REQUEST_DENIED from key restrictions) instead of
  /// silently rendering "no results".
  void _ensureOkStatus(Map<String, dynamic>? data) {
    final status = data?['status'] as String?;
    if (status == null || status == 'OK' || status == 'ZERO_RESULTS') return;
    final raw = data?['error_message'] as String?;
    final lower = '${raw ?? ''} $status'.toLowerCase();
    final message = lower.contains('billing')
        ? 'Google Maps billing is not enabled on this Cloud project. '
            'Open Google Cloud Console → Billing and enable billing, then retry. '
            'Maps Platform includes a monthly free credit.'
        : raw;
    throw PlacesApiException(status, message);
  }

  Future<List<PlaceSummary>> nearbySearch({
    required double lat,
    required double lng,
    String? type,
    String? keyword,
    int radiusMeters = 1500,
  }) async {
    // Google only supports a fixed set of nearby-search types; anything else
    // (e.g. "market") must be sent as a keyword or it returns zero results.
    final isSupportedType = type != null && _supportedNearbyTypes.contains(type);
    final effectiveKeyword =
        keyword ?? (type != null && !isSupportedType ? type : null);

    final response = await _dio.get<Map<String, dynamic>>(
      '$_base/place/nearbysearch/json',
      queryParameters: {
        'location': '$lat,$lng',
        'radius': radiusMeters,
        if (isSupportedType) 'type': type,
        if (effectiveKeyword != null) 'keyword': effectiveKeyword,
        'language': language,
        'key': _key,
      },
    );
    _ensureOkStatus(response.data);

    final results = (response.data?['results'] as List<dynamic>? ?? []);
    return results.map((raw) => _mapSummary(raw as Map<String, dynamic>)).toList();
  }

  /// Free-text search fallback when geocoding finds nothing (e.g. local
  /// place names Google's geocoder doesn't know but Places does).
  Future<List<PlaceSummary>> textSearch(
    String query, {
    double? lat,
    double? lng,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '$_base/place/textsearch/json',
      queryParameters: {
        'query': query,
        if (lat != null && lng != null) 'location': '$lat,$lng',
        if (lat != null && lng != null) 'radius': 50000,
        'language': language,
        'key': _key,
      },
    );
    _ensureOkStatus(response.data);
    final results = (response.data?['results'] as List<dynamic>? ?? []);
    return results.map((raw) => _mapSummary(raw as Map<String, dynamic>)).toList();
  }

  Future<List<AutocompleteSuggestion>> autocomplete(String input) async {
    if (input.trim().length < 2) return [];
    final response = await _dio.get<Map<String, dynamic>>(
      '$_base/place/autocomplete/json',
      queryParameters: {
        'input': input,
        'language': language,
        'key': _key,
      },
    );
    _ensureOkStatus(response.data);
    final predictions = response.data?['predictions'] as List<dynamic>? ?? [];
    return predictions.map((raw) {
      final map = raw as Map<String, dynamic>;
      final structured = map['structured_formatting'] as Map<String, dynamic>?;
      return AutocompleteSuggestion(
        placeId: map['place_id'] as String,
        description: map['description'] as String? ?? '',
        mainText: structured?['main_text'] as String?,
        secondaryText: structured?['secondary_text'] as String?,
      );
    }).toList();
  }

  Future<PlaceDetails> placeDetails(String placeId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '$_base/place/details/json',
      queryParameters: {
        'place_id': placeId,
        'fields':
            'place_id,name,formatted_address,geometry,rating,user_ratings_total,'
            'photos,types,opening_hours,formatted_phone_number,website,'
            'price_level,reviews,editorial_summary',
        'language': language,
        'key': _key,
      },
    );
    _ensureOkStatus(response.data);
    final result = response.data?['result'] as Map<String, dynamic>?;
    if (result == null) {
      throw StateError('Place not found');
    }
    return _mapDetails(result);
  }

  Future<({double lat, double lng, String? formattedAddress})?> geocode(
    String query,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '$_base/geocode/json',
      queryParameters: {
        'address': query,
        'language': language,
        'key': _key,
      },
    );
    _ensureOkStatus(response.data);
    final results = response.data?['results'] as List<dynamic>? ?? [];
    if (results.isEmpty) return null;
    final first = results.first as Map<String, dynamic>;
    final location =
        (first['geometry'] as Map<String, dynamic>)['location']
            as Map<String, dynamic>;
    return (
      lat: (location['lat'] as num).toDouble(),
      lng: (location['lng'] as num).toDouble(),
      formattedAddress: first['formatted_address'] as String?,
    );
  }

  Future<({String? formattedAddress})?> reverseGeocode({
    required double lat,
    required double lng,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '$_base/geocode/json',
      queryParameters: {
        'latlng': '$lat,$lng',
        'language': language,
        'key': _key,
      },
    );
    _ensureOkStatus(response.data);
    final results = response.data?['results'] as List<dynamic>? ?? [];
    if (results.isEmpty) return null;
    final first = results.first as Map<String, dynamic>;
    return (formattedAddress: first['formatted_address'] as String?);
  }

  String photoUrl(String photoReference, {int maxWidth = 800}) {
    return '$_base/place/photo?maxwidth=$maxWidth&photo_reference=$photoReference&key=$_key';
  }

  PlaceSummary _mapSummary(Map<String, dynamic> map) {
    final geometry = map['geometry'] as Map<String, dynamic>?;
    final location = geometry?['location'] as Map<String, dynamic>?;
    final photos = map['photos'] as List<dynamic>?;
    final photoRef = photos != null && photos.isNotEmpty
        ? (photos.first as Map<String, dynamic>)['photo_reference'] as String?
        : null;
    final opening = map['opening_hours'] as Map<String, dynamic>?;

    return PlaceSummary(
      placeId: map['place_id'] as String? ?? '',
      name: map['name'] as String? ?? 'Unknown',
      address: map['vicinity'] as String? ?? map['formatted_address'] as String?,
      lat: (location?['lat'] as num?)?.toDouble(),
      lng: (location?['lng'] as num?)?.toDouble(),
      rating: (map['rating'] as num?)?.toDouble(),
      userRatingsTotal: map['user_ratings_total'] as int?,
      photoReference: photoRef,
      types: (map['types'] as List<dynamic>? ?? []).cast<String>(),
      openNow: opening?['open_now'] as bool?,
      priceLevel: map['price_level'] as int?,
    );
  }

  PlaceDetails _mapDetails(Map<String, dynamic> map) {
    final summary = _mapSummary(map);
    final photos = map['photos'] as List<dynamic>? ?? [];
    final reviews = map['reviews'] as List<dynamic>? ?? [];
    final opening = map['opening_hours'] as Map<String, dynamic>?;
    final editorial = map['editorial_summary'] as Map<String, dynamic>?;

    return PlaceDetails(
      placeId: summary.placeId,
      name: summary.name,
      address: map['formatted_address'] as String? ?? summary.address,
      lat: summary.lat,
      lng: summary.lng,
      rating: summary.rating,
      userRatingsTotal: summary.userRatingsTotal,
      photoReference: summary.photoReference,
      types: summary.types,
      openNow: summary.openNow,
      priceLevel: summary.priceLevel,
      phone: map['formatted_phone_number'] as String?,
      website: map['website'] as String?,
      weekdayText:
          (opening?['weekday_text'] as List<dynamic>? ?? []).cast<String>(),
      photoReferences: photos
          .map((p) => (p as Map<String, dynamic>)['photo_reference'] as String)
          .toList(),
      reviews: reviews.map((raw) {
        final r = raw as Map<String, dynamic>;
        return PlaceReview(
          authorName: r['author_name'] as String? ?? 'Anonymous',
          rating: (r['rating'] as num?)?.toInt() ?? 0,
          text: r['text'] as String? ?? '',
          relativeTime: r['relative_time_description'] as String?,
        );
      }).toList(),
      editorialSummary: editorial?['overview'] as String?,
    );
  }
}

/// Types accepted by the Places Nearby Search `type` parameter.
const _supportedNearbyTypes = <String>{
  'accounting', 'airport', 'amusement_park', 'aquarium', 'art_gallery',
  'atm', 'bakery', 'bank', 'bar', 'beauty_salon', 'bicycle_store',
  'book_store', 'bowling_alley', 'bus_station', 'cafe', 'campground',
  'car_dealer', 'car_rental', 'car_repair', 'car_wash', 'casino',
  'cemetery', 'church', 'city_hall', 'clothing_store', 'convenience_store',
  'courthouse', 'dentist', 'department_store', 'doctor', 'drugstore',
  'electrician', 'electronics_store', 'embassy', 'fire_station', 'florist',
  'funeral_home', 'furniture_store', 'gas_station', 'gym', 'hair_care',
  'hardware_store', 'hindu_temple', 'home_goods_store', 'hospital',
  'insurance_agency', 'jewelry_store', 'laundry', 'lawyer', 'library',
  'light_rail_station', 'liquor_store', 'local_government_office',
  'locksmith', 'lodging', 'meal_delivery', 'meal_takeaway', 'mosque',
  'movie_rental', 'movie_theater', 'moving_company', 'museum', 'night_club',
  'painter', 'park', 'parking', 'pet_store', 'pharmacy', 'physiotherapist',
  'plumber', 'police', 'post_office', 'primary_school', 'real_estate_agency',
  'restaurant', 'roofing_contractor', 'rv_park', 'school', 'secondary_school',
  'shoe_store', 'shopping_mall', 'spa', 'stadium', 'storage', 'store',
  'subway_station', 'supermarket', 'synagogue', 'taxi_stand',
  'tourist_attraction', 'train_station', 'transit_station', 'travel_agency',
  'university', 'veterinary_care', 'zoo',
};
