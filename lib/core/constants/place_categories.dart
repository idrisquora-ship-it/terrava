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

PlaceCategory? categoryForTypeKey(String typeKey) {
  for (final c in kPlaceCategories) {
    if (c.typeKey == typeKey) return c;
  }
  return null;
}
