import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/app_preferences.dart';
import '../models/place_models.dart';

final offlineCacheProvider = Provider((ref) => OfflineCache(ref));

class OfflineCache {
  OfflineCache(this._ref);
  final Ref _ref;

  static String _placeKey(String placeId) => 'terrava_place_cache_$placeId';

  Future<void> savePlaceDetails(PlaceDetails place) async {
    final payload = {
      'placeId': place.placeId,
      'name': place.name,
      'address': place.address,
      'lat': place.lat,
      'lng': place.lng,
      'rating': place.rating,
      'userRatingsTotal': place.userRatingsTotal,
      'photoReference': place.photoReference,
      'types': place.types,
      'openNow': place.openNow,
      'priceLevel': place.priceLevel,
      'phone': place.phone,
      'website': place.website,
      'weekdayText': place.weekdayText,
      'photoReferences': place.photoReferences,
      'editorialSummary': place.editorialSummary,
      'reviews': place.reviews
          .map(
            (r) => {
              'authorName': r.authorName,
              'rating': r.rating,
              'text': r.text,
              'relativeTime': r.relativeTime,
            },
          )
          .toList(),
      'cachedAt': DateTime.now().toIso8601String(),
    };
    await _ref
        .read(appPrefsProvider)
        .setString(_placeKey(place.placeId), jsonEncode(payload));
  }

  Future<PlaceDetails?> readPlaceDetails(String placeId) async {
    final raw = _ref.read(appPrefsProvider).getString(_placeKey(placeId));
    if (raw == null) return null;
    final map = jsonDecode(raw) as Map<String, dynamic>;
    return PlaceDetails(
      placeId: map['placeId'] as String,
      name: map['name'] as String? ?? 'Unknown',
      address: map['address'] as String?,
      lat: (map['lat'] as num?)?.toDouble(),
      lng: (map['lng'] as num?)?.toDouble(),
      rating: (map['rating'] as num?)?.toDouble(),
      userRatingsTotal: map['userRatingsTotal'] as int?,
      photoReference: map['photoReference'] as String?,
      types: (map['types'] as List<dynamic>? ?? []).cast<String>(),
      openNow: map['openNow'] as bool?,
      priceLevel: map['priceLevel'] as int?,
      phone: map['phone'] as String?,
      website: map['website'] as String?,
      weekdayText: (map['weekdayText'] as List<dynamic>? ?? []).cast<String>(),
      photoReferences:
          (map['photoReferences'] as List<dynamic>? ?? []).cast<String>(),
      editorialSummary: map['editorialSummary'] as String?,
      reviews: (map['reviews'] as List<dynamic>? ?? [])
          .map(
            (r) => PlaceReview(
              authorName: r['authorName'] as String? ?? 'Anonymous',
              rating: (r['rating'] as num?)?.toInt() ?? 0,
              text: r['text'] as String? ?? '',
              relativeTime: r['relativeTime'] as String?,
            ),
          )
          .toList(),
    );
  }
}
