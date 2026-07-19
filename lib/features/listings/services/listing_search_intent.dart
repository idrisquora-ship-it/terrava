import '../../listings/models/listing.dart';

/// Heuristics so "house for rent" prefers rental listings, etc.
({ListingKind? kind, String? category, String cleanedQuery})
    parseListingSearchIntent(String raw) {
  final q = raw.trim().toLowerCase();
  if (q.isEmpty) {
    return (kind: null, category: null, cleanedQuery: raw.trim());
  }

  ListingKind? kind;
  String? category;

  if (q.contains('rent') || q.contains('lease') || q.contains('tenant')) {
    kind = ListingKind.rental;
  } else if (q.contains('sale') ||
      q.contains('buy') ||
      q.contains('for sale')) {
    kind = ListingKind.sale;
  }

  const categoryHints = <String, String>{
    'house': 'house',
    'apartment': 'apartment',
    'flat': 'apartment',
    'room': 'room',
    'duplex': 'duplex',
    'land': 'land',
    'restaurant': 'restaurant',
    'hotel': 'hotel',
    'shop': 'shop',
    'store': 'shop',
    'pharmacy': 'pharmacy',
    'bank': 'bank',
    'school': 'school',
    'supermarket': 'supermarket',
    'market': 'market',
    'fuel': 'fuel',
    'gas': 'fuel',
  };

  for (final entry in categoryHints.entries) {
    if (q.contains(entry.key)) {
      category = entry.value;
      break;
    }
  }

  if (kind == null &&
      category != null &&
      {
        'restaurant',
        'hotel',
        'shop',
        'pharmacy',
        'bank',
        'school',
        'supermarket',
        'market',
        'fuel',
      }.contains(category)) {
    kind = ListingKind.business;
  }

  return (kind: kind, category: category, cleanedQuery: raw.trim());
}
