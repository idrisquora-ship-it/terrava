/// Quick category definitions for Home / Map filters.
class PlaceCategory {
  const PlaceCategory({
    required this.id,
    required this.label,
    required this.googleType,
    required this.iconName,
  });

  final String id;
  final String label;
  final String googleType;
  final String iconName;
}

const kPlaceCategories = <PlaceCategory>[
  PlaceCategory(
    id: 'restaurants',
    label: 'Restaurants',
    googleType: 'restaurant',
    iconName: 'restaurant',
  ),
  PlaceCategory(
    id: 'hotels',
    label: 'Hotels',
    googleType: 'lodging',
    iconName: 'hotel',
  ),
  PlaceCategory(
    id: 'hospitals',
    label: 'Hospitals',
    googleType: 'hospital',
    iconName: 'local_hospital',
  ),
  PlaceCategory(
    id: 'banks',
    label: 'Banks',
    googleType: 'bank',
    iconName: 'account_balance',
  ),
  PlaceCategory(
    id: 'pharmacies',
    label: 'Pharmacies',
    googleType: 'pharmacy',
    iconName: 'local_pharmacy',
  ),
  PlaceCategory(
    id: 'schools',
    label: 'Schools',
    googleType: 'school',
    iconName: 'school',
  ),
  PlaceCategory(
    id: 'supermarkets',
    label: 'Supermarkets',
    googleType: 'supermarket',
    iconName: 'local_grocery_store',
  ),
  PlaceCategory(
    id: 'markets',
    label: 'Markets',
    googleType: 'market',
    iconName: 'storefront',
  ),
  PlaceCategory(
    id: 'fuel',
    label: 'Fuel',
    googleType: 'gas_station',
    iconName: 'local_gas_station',
  ),
];
