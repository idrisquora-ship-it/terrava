import 'dart:convert';
import 'dart:math';

import 'package:equatable/equatable.dart';

import '../../../shared/models/place_models.dart';

class GroupScore extends Equatable {
  const GroupScore({
    required this.id,
    required this.label,
    required this.score,
    required this.count,
    this.avgRating,
    this.nearestDistanceM,
  });

  final String id;
  final String label;
  final double score;
  final int count;
  final double? avgRating;
  final double? nearestDistanceM;

  @override
  List<Object?> get props => [id, score, count];
}

class NeighborhoodScoreResult extends Equatable {
  const NeighborhoodScoreResult({
    required this.overall,
    required this.groups,
    required this.summary,
    required this.radiusMeters,
    this.securityScore = 0,
    this.securitySummary = '',
  });

  final double overall;
  final List<GroupScore> groups;
  final String summary;
  final int radiusMeters;

  /// Amenity-based security signals (0–100). Not official crime data.
  final double securityScore;
  final String securitySummary;

  Map<String, dynamic> toJson() => {
        'overall': overall,
        'radiusMeters': radiusMeters,
        'summary': summary,
        'securityScore': securityScore,
        'securitySummary': securitySummary,
        'groups': groups
            .map(
              (g) => {
                'id': g.id,
                'label': g.label,
                'score': g.score,
                'count': g.count,
                'avgRating': g.avgRating,
                'nearestDistanceM': g.nearestDistanceM,
              },
            )
            .toList(),
      };

  factory NeighborhoodScoreResult.fromJson(Map<String, dynamic> json) {
    return NeighborhoodScoreResult(
      overall: (json['overall'] as num).toDouble(),
      radiusMeters: json['radiusMeters'] as int? ?? 1500,
      summary: json['summary'] as String? ?? '',
      securityScore: (json['securityScore'] as num?)?.toDouble() ?? 0,
      securitySummary: json['securitySummary'] as String? ?? '',
      groups: (json['groups'] as List<dynamic>? ?? [])
          .map(
            (g) => GroupScore(
              id: g['id'] as String,
              label: g['label'] as String,
              score: (g['score'] as num).toDouble(),
              count: g['count'] as int? ?? 0,
              avgRating: (g['avgRating'] as num?)?.toDouble(),
              nearestDistanceM: (g['nearestDistanceM'] as num?)?.toDouble(),
            ),
          )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [overall, groups, summary, securityScore];
}

class NeighborhoodScoreEngine {
  const NeighborhoodScoreEngine();

  static const groupDefs = <({
    String id,
    String label,
    List<String> types,
    int targetCount,
    double weight,
    double maxDistanceM,
  })>[
    (
      id: 'essentials',
      label: 'Essentials',
      types: ['supermarket', 'grocery_or_supermarket', 'convenience_store', 'pharmacy'],
      targetCount: 6,
      weight: 0.25,
      maxDistanceM: 1200,
    ),
    (
      id: 'health',
      label: 'Health',
      types: ['hospital', 'doctor', 'dentist', 'pharmacy'],
      targetCount: 4,
      weight: 0.20,
      maxDistanceM: 2000,
    ),
    (
      id: 'food',
      label: 'Food',
      types: ['restaurant', 'cafe', 'bakery'],
      targetCount: 10,
      weight: 0.15,
      maxDistanceM: 1000,
    ),
    (
      id: 'transport',
      label: 'Transport',
      types: [
        'bus_station',
        'subway_station',
        'train_station',
        'transit_station',
        'taxi_stand',
      ],
      targetCount: 4,
      weight: 0.15,
      maxDistanceM: 1500,
    ),
    (
      id: 'money',
      label: 'Banks & ATMs',
      types: ['bank', 'atm'],
      targetCount: 4,
      weight: 0.10,
      maxDistanceM: 1200,
    ),
    (
      id: 'education',
      label: 'Education',
      types: ['school', 'primary_school', 'secondary_school', 'university'],
      targetCount: 3,
      weight: 0.10,
      maxDistanceM: 2000,
    ),
    (
      id: 'fuel',
      label: 'Fuel',
      types: ['gas_station'],
      targetCount: 2,
      weight: 0.05,
      maxDistanceM: 2500,
    ),
  ];

  static Set<String> get allPlaceTypes => {
        for (final g in groupDefs) ...g.types,
        'police',
        'fire_station',
      };

  NeighborhoodScoreResult compute({
    required double lat,
    required double lng,
    required Map<String, List<PlaceSummary>> placesByType,
    String? areaName,
    int radiusMeters = 4000,
  }) {
    final groupScores = <GroupScore>[];

    for (final def in groupDefs) {
      final pool = <PlaceSummary>[];
      for (final type in def.types) {
        pool.addAll(placesByType[type] ?? const []);
      }
      // de-dupe by placeId
      final unique = <String, PlaceSummary>{};
      for (final p in pool) {
        unique[p.placeId] = p;
      }
      final places = unique.values.toList();
      final count = places.length;
      final avgRating = places.isEmpty
          ? null
          : places
                  .map((p) => p.rating ?? 0.0)
                  .fold<double>(0.0, (a, b) => a + b) /
              places.length;

      double? nearest;
      for (final p in places) {
        if (p.lat == null || p.lng == null) continue;
        final d = _haversineM(lat, lng, p.lat!, p.lng!);
        nearest = nearest == null ? d : min(nearest, d);
      }

      final coverage = _clamp(count / def.targetCount, 0, 1);
      final quality = avgRating == null
          ? 0.0
          : _clamp((avgRating - 3.0) / 2.0, 0, 1);
      final access = nearest == null
          ? 0.0
          : 1 - _clamp(nearest / def.maxDistanceM, 0, 1);
      final score = 100 * (0.45 * coverage + 0.30 * quality + 0.25 * access);

      groupScores.add(
        GroupScore(
          id: def.id,
          label: def.label,
          score: score,
          count: count,
          avgRating: avgRating,
          nearestDistanceM: nearest,
        ),
      );
    }

    var overall = 0.0;
    for (var i = 0; i < groupDefs.length; i++) {
      overall += groupScores[i].score * groupDefs[i].weight;
    }

    final sorted = [...groupScores]..sort((a, b) => b.score.compareTo(a.score));
    final strongest = sorted.first;
    final weakest = sorted.last;
    final name = areaName ?? 'This area';
    final essentials = groupScores.firstWhere((g) => g.id == 'essentials');
    final health = groupScores.firstWhere((g) => g.id == 'health');
    final food = groupScores.firstWhere((g) => g.id == 'food');
    final transport = groupScores.firstWhere((g) => g.id == 'transport');

    final security = _securitySignals(
      lat: lat,
      lng: lng,
      placesByType: placesByType,
      healthCount: health.count,
      foodCount: food.count,
      essentialsCount: essentials.count,
      radiusMeters: radiusMeters,
    );

    final summary =
        '$name scores ${overall.round()}/100 for everyday convenience '
        '(amenity access — not crime or official livability). '
        'Strongest: ${strongest.label}. Weakest: ${weakest.label}. '
        'Within ${(radiusMeters / 1000).toStringAsFixed(1)} km: '
        '${essentials.count} grocery/pharmacy options, '
        '${health.count} health-related places, '
        '${food.count} food places, '
        '${transport.count} transit-related places.';

    return NeighborhoodScoreResult(
      overall: overall,
      groups: groupScores,
      summary: summary,
      radiusMeters: radiusMeters,
      securityScore: security.score,
      securitySummary: security.summary,
    );
  }

  static ({double score, String summary}) _securitySignals({
    required double lat,
    required double lng,
    required Map<String, List<PlaceSummary>> placesByType,
    required int healthCount,
    required int foodCount,
    required int essentialsCount,
    required int radiusMeters,
  }) {
    final police = placesByType['police'] ?? const <PlaceSummary>[];
    final fire = placesByType['fire_station'] ?? const <PlaceSummary>[];
    final uniqueEmergency = <String, PlaceSummary>{};
    for (final p in [...police, ...fire]) {
      uniqueEmergency[p.placeId] = p;
    }
    final emergencyCount = uniqueEmergency.length;

    double? nearestEmergency;
    for (final p in uniqueEmergency.values) {
      if (p.lat == null || p.lng == null) continue;
      final d = _haversineM(lat, lng, p.lat!, p.lng!);
      nearestEmergency =
          nearestEmergency == null ? d : min(nearestEmergency, d);
    }

    // Presence of emergency services + nearby medical + everyday activity.
    final emergencyCoverage = _clamp(emergencyCount / 2.0, 0, 1);
    final medicalCoverage = _clamp(healthCount / 3.0, 0, 1);
    final activityCoverage =
        _clamp((foodCount + essentialsCount) / 12.0, 0, 1);
    final proximity = nearestEmergency == null
        ? 0.15
        : 1 - _clamp(nearestEmergency / 2500.0, 0, 1);

    final score = 100 *
        (0.40 * emergencyCoverage +
            0.25 * medicalCoverage +
            0.20 * proximity +
            0.15 * activityCoverage);

    final summary =
        'Security signals ${score.round()}/100 (estimate from nearby '
        'police/fire, hospitals, and everyday activity within '
        '${(radiusMeters / 1000).toStringAsFixed(1)} km — not official crime data). '
        'Police/fire nearby: $emergencyCount. Health options: $healthCount.';

    return (score: score, summary: summary);
  }

  static double _clamp(double v, double minV, double maxV) =>
      max(minV, min(maxV, v));

  static double _haversineM(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const r = 6371000.0;
    final dLat = _rad(lat2 - lat1);
    final dLon = _rad(lon2 - lon1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_rad(lat1)) * cos(_rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    return 2 * r * atan2(sqrt(a), sqrt(1 - a));
  }

  static double _rad(double deg) => deg * pi / 180;

  static String geohash(double lat, double lng, {int precision = 6}) {
    // Simple grid hash for cache keys (not full geohash algorithm).
    final latKey = (lat * pow(10, precision - 2)).round();
    final lngKey = (lng * pow(10, precision - 2)).round();
    return '$latKey:$lngKey';
  }

  static String encodeCache(NeighborhoodScoreResult result) =>
      jsonEncode(result.toJson());
}
