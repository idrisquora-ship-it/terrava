import 'package:flutter_test/flutter_test.dart';
import 'package:terrava/features/scoring/services/neighborhood_score_engine.dart';
import 'package:terrava/shared/models/place_models.dart';

void main() {
  test('NeighborhoodScoreEngine returns deterministic amenity score', () {
    const engine = NeighborhoodScoreEngine();
    final result = engine.compute(
      lat: 6.45,
      lng: 3.39,
      areaName: 'Test Area',
      placesByType: {
        'supermarket': [
          const PlaceSummary(
            placeId: 's1',
            name: 'Market',
            lat: 6.451,
            lng: 3.391,
            rating: 4.5,
          ),
        ],
        'hospital': [
          const PlaceSummary(
            placeId: 'h1',
            name: 'Clinic',
            lat: 6.452,
            lng: 3.392,
            rating: 4.0,
          ),
        ],
        'restaurant': [
          for (var i = 0; i < 5; i++)
            PlaceSummary(
              placeId: 'r$i',
              name: 'Food $i',
              lat: 6.4505,
              lng: 3.3905,
              rating: 4.2,
            ),
        ],
        'bus_station': [
          const PlaceSummary(
            placeId: 't1',
            name: 'Bus',
            lat: 6.45,
            lng: 3.39,
            rating: 3.8,
          ),
        ],
        'bank': [
          const PlaceSummary(
            placeId: 'b1',
            name: 'Bank',
            lat: 6.4502,
            lng: 3.3902,
            rating: 4.1,
          ),
        ],
        'school': [
          const PlaceSummary(
            placeId: 'e1',
            name: 'School',
            lat: 6.4515,
            lng: 3.3915,
            rating: 4.0,
          ),
        ],
        'gas_station': [
          const PlaceSummary(
            placeId: 'f1',
            name: 'Fuel',
            lat: 6.453,
            lng: 3.393,
            rating: 3.5,
          ),
        ],
      },
    );

    expect(result.overall, greaterThan(0));
    expect(result.overall, lessThanOrEqualTo(100));
    expect(result.summary.contains('Test Area'), isTrue);
    expect(result.summary.contains('not crime'), isTrue);
    expect(result.groups.length, NeighborhoodScoreEngine.groupDefs.length);
  });
}
