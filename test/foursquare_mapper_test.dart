import 'package:flutter_test/flutter_test.dart';
import 'package:terrava/shared/services/places_service.dart';

void main() {
  test('maps new Places API search/details JSON (top-level lat/lng)', () {
    final json = <String, dynamic>{
      'fsq_place_id': '51a4a2c4498e04232d9dd3a7',
      'latitude': 6.5289993327366735,
      'longitude': 3.3859386052713405,
      'name': 'Chicken Republic',
      'categories': [
        {
          'fsq_category_id': '4bf58dd8d48988d16e941735',
          'name': 'Fast Food Restaurant',
        },
      ],
      'location': {
        'address': 'St Finbarrs Road,Akoka',
        'locality': 'Lagos',
        'region': 'Lagos',
        'formatted_address': 'St Finbarrs Road,Akoka, Lagos, Lagos',
      },
      'tel': '+2348000000000',
      'website': 'https://example.com',
    };

    final summary = mapFoursquarePlaceSummary(json);
    expect(summary.placeId, '51a4a2c4498e04232d9dd3a7');
    expect(summary.name, 'Chicken Republic');
    expect(summary.lat, closeTo(6.5289993327366735, 1e-9));
    expect(summary.lng, closeTo(3.3859386052713405, 1e-9));
    expect(summary.address, contains('Lagos'));
    expect(summary.types, contains('fast_food_restaurant'));

    final details = mapFoursquarePlaceDetails(json);
    expect(details.address, 'St Finbarrs Road,Akoka, Lagos, Lagos');
    expect(details.phone, '+2348000000000');
    expect(details.website, 'https://example.com');
  });

  test('falls back to legacy geocodes.main coordinates', () {
    final json = <String, dynamic>{
      'fsq_id': 'legacy123',
      'name': 'Legacy Spot',
      'geocodes': {
        'main': {'latitude': 7.5, 'longitude': 4.5},
      },
      'location': {'locality': 'Osogbo'},
      'categories': [],
    };

    final summary = mapFoursquarePlaceSummary(json);
    expect(summary.placeId, 'legacy123');
    expect(summary.lat, 7.5);
    expect(summary.lng, 4.5);
  });
}
