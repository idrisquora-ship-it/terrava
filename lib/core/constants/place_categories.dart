/// Quick category definitions for Home / Map filters.
///
/// [typeKey] is used in routes and scoring. [fsqCategoryIds] maps to
/// Foursquare Places category IDs for nearby search.
class PlaceCategory {
  const PlaceCategory({
    required this.id,
    required this.label,
    required this.typeKey,
    required this.fsqCategoryIds,
    required this.iconName,
  });

  final String id;
  final String label;

  /// Stable key used in `/category/:type` routes and score engine.
  final String typeKey;

  /// Foursquare category IDs (comma-join for Place Search).
  final List<String> fsqCategoryIds;

  final String iconName;

  /// Back-compat alias used across existing call sites.
  String get googleType => typeKey;
}

const kPlaceCategories = <PlaceCategory>[
  PlaceCategory(
    id: 'restaurants',
    label: 'Restaurants',
    typeKey: 'restaurant',
    // Food parent (includes restaurants / fast food / cafés).
    // Granular "Restaurant" alone returns empty in Lagos on current Places API.
    fsqCategoryIds: ['4d4b7105d754a06374d81259'],
    iconName: 'restaurant',
  ),
  PlaceCategory(
    id: 'hotels',
    label: 'Hotels',
    typeKey: 'lodging',
    // Travel > Hotel
    fsqCategoryIds: ['4bf58dd8d48988d1fa931735'],
    iconName: 'hotel',
  ),
  PlaceCategory(
    id: 'hospitals',
    label: 'Hospitals',
    typeKey: 'hospital',
    // Hospital
    fsqCategoryIds: ['4bf58dd8d48988d196941735'],
    iconName: 'local_hospital',
  ),
  PlaceCategory(
    id: 'banks',
    label: 'Banks',
    typeKey: 'bank',
    fsqCategoryIds: ['4bf58dd8d48988d10a951735'],
    iconName: 'account_balance',
  ),
  PlaceCategory(
    id: 'pharmacies',
    label: 'Pharmacies',
    typeKey: 'pharmacy',
    fsqCategoryIds: ['4bf58dd8d48988d10f951735'],
    iconName: 'local_pharmacy',
  ),
  PlaceCategory(
    id: 'schools',
    label: 'Schools',
    typeKey: 'school',
    fsqCategoryIds: ['4bf58dd8d48988d13b941735'],
    iconName: 'school',
  ),
  PlaceCategory(
    id: 'supermarkets',
    label: 'Supermarkets',
    typeKey: 'supermarket',
    fsqCategoryIds: ['52f2ab2ebcbc57f1066b8b46'],
    iconName: 'local_grocery_store',
  ),
  PlaceCategory(
    id: 'markets',
    label: 'Markets',
    typeKey: 'market',
    // Farmers Market + Grocery Store (legacy "Market" id is sparse in NG).
    fsqCategoryIds: [
      '4bf58dd8d48988d1fa941735',
      '4bf58dd8d48988d118951735',
    ],
    iconName: 'storefront',
  ),
  PlaceCategory(
    id: 'fuel',
    label: 'Fuel',
    typeKey: 'gas_station',
    fsqCategoryIds: ['4bf58dd8d48988d113951735'],
    iconName: 'local_gas_station',
  ),
];

/// Extra Foursquare IDs used by the neighborhood score engine / security signals.
const kScoreTypeFsqCategoryIds = <String, List<String>>{
  'restaurant': ['4d4b7105d754a06374d81259'],
  'cafe': ['4bf58dd8d48988d16d941735'],
  'bakery': ['4bf58dd8d48988d16a941735'],
  'supermarket': ['52f2ab2ebcbc57f1066b8b46'],
  'grocery_or_supermarket': ['4bf58dd8d48988d118951735'],
  'convenience_store': ['4d954b0ea243a5684a65b473'],
  'pharmacy': ['4bf58dd8d48988d10f951735'],
  'hospital': ['4bf58dd8d48988d196941735'],
  'doctor': ['4bf58dd8d48988d177941735'],
  'dentist': ['4bf58dd8d48988d178941735'],
  'bank': ['4bf58dd8d48988d10a951735'],
  'atm': ['52f2ab2ebcbc57f1066b8b56'],
  'school': ['4bf58dd8d48988d13b941735'],
  'primary_school': ['4f4533804b9074f6e4fb0105'],
  'secondary_school': ['4bf58dd8d48988d13d941735'],
  'university': ['4bf58dd8d48988d1ae941735'],
  'bus_station': ['4bf58dd8d48988d1fe931735'],
  'subway_station': ['4bf58dd8d48988d1fd931735'],
  'train_station': ['4bf58dd8d48988d129951735'],
  'transit_station': ['4f4531504b9074f6e4fb0102'],
  'taxi_stand': ['53fca564f3640ab0dc74c3cd'],
  'gas_station': ['4bf58dd8d48988d113951735'],
  'lodging': ['4bf58dd8d48988d1fa931735'],
  'police': ['4bf58dd8d48988d12e941735'],
  'fire_station': ['4bf58dd8d48988d12c941735'],
};

PlaceCategory? categoryForTypeKey(String typeKey) {
  for (final c in kPlaceCategories) {
    if (c.typeKey == typeKey) return c;
  }
  return null;
}

/// Resolves Foursquare category IDs for UI categories and score-engine types.
List<String> fsqCategoryIdsForType(String typeKey) {
  final fromUi = categoryForTypeKey(typeKey);
  if (fromUi != null && fromUi.fsqCategoryIds.isNotEmpty) {
    return fromUi.fsqCategoryIds;
  }
  return kScoreTypeFsqCategoryIds[typeKey] ?? const [];
}

/// Keyword fallback when category filters are sparse (common in smaller NG cities).
String? searchKeywordForType(String typeKey) {
  return switch (typeKey) {
    'restaurant' || 'cafe' || 'bakery' => 'restaurant',
    'hospital' || 'doctor' || 'dentist' => 'hospital',
    'pharmacy' => 'pharmacy',
    'bank' || 'atm' => 'bank',
    'school' ||
    'primary_school' ||
    'secondary_school' ||
    'university' =>
      'school',
    'supermarket' ||
    'grocery_or_supermarket' ||
    'convenience_store' ||
    'market' =>
      'market',
    'gas_station' => 'fuel',
    'lodging' => 'hotel',
    'bus_station' ||
    'subway_station' ||
    'train_station' ||
    'transit_station' ||
    'taxi_stand' =>
      'bus park',
    'police' => 'police',
    'fire_station' => 'fire station',
    _ => typeKey.replaceAll('_', ' '),
  };
}
