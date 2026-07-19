import 'package:equatable/equatable.dart';

class PlaceSummary extends Equatable {
  const PlaceSummary({
    required this.placeId,
    required this.name,
    this.address,
    this.lat,
    this.lng,
    this.rating,
    this.userRatingsTotal,
    this.photoReference,
    this.types = const [],
    this.openNow,
    this.priceLevel,
  });

  final String placeId;
  final String name;
  final String? address;
  final double? lat;
  final double? lng;
  final double? rating;
  final int? userRatingsTotal;
  final String? photoReference;
  final List<String> types;
  final bool? openNow;
  final int? priceLevel;

  String? get primaryType => types.isEmpty ? null : types.first;

  @override
  List<Object?> get props => [placeId];
}

class PlaceDetails extends PlaceSummary {
  const PlaceDetails({
    required super.placeId,
    required super.name,
    super.address,
    super.lat,
    super.lng,
    super.rating,
    super.userRatingsTotal,
    super.photoReference,
    super.types,
    super.openNow,
    super.priceLevel,
    this.phone,
    this.website,
    this.weekdayText = const [],
    this.photoReferences = const [],
    this.reviews = const [],
    this.editorialSummary,
  });

  final String? phone;
  final String? website;
  final List<String> weekdayText;
  final List<String> photoReferences;
  final List<PlaceReview> reviews;
  final String? editorialSummary;
}

class PlaceReview extends Equatable {
  const PlaceReview({
    required this.authorName,
    required this.rating,
    required this.text,
    this.relativeTime,
  });

  final String authorName;
  final int rating;
  final String text;
  final String? relativeTime;

  @override
  List<Object?> get props => [authorName, rating, text];
}

class AutocompleteSuggestion extends Equatable {
  const AutocompleteSuggestion({
    required this.placeId,
    required this.description,
    this.mainText,
    this.secondaryText,
    this.lat,
    this.lng,
    this.isPoi = false,
  });

  final String placeId;
  final String description;
  final String? mainText;
  final String? secondaryText;
  final double? lat;
  final double? lng;

  /// True when Mapbox classifies the feature as a point of interest.
  final bool isPoi;

  @override
  List<Object?> get props => [placeId];
}

class RouteDirections extends Equatable {
  const RouteDirections({
    required this.points,
    required this.distanceText,
    required this.durationText,
  });

  final List<({double lat, double lng})> points;
  final String distanceText;
  final String durationText;

  @override
  List<Object?> get props => [distanceText, durationText, points.length];
}
