enum ListingKind {
  rental,
  sale,
  business;

  static ListingKind fromDb(String value) {
    return ListingKind.values.firstWhere(
      (k) => k.name == value,
      orElse: () => ListingKind.business,
    );
  }
}

enum ListingPricePeriod {
  monthly,
  yearly,
  negotiable,
  total;

  static ListingPricePeriod? fromDb(String? value) {
    if (value == null || value.isEmpty) return null;
    for (final v in ListingPricePeriod.values) {
      if (v.name == value) return v;
    }
    return null;
  }
}

class Listing {
  const Listing({
    required this.id,
    required this.ownerUserId,
    required this.kind,
    required this.category,
    required this.title,
    required this.description,
    this.price,
    this.currency = 'NGN',
    this.pricePeriod,
    this.availableFrom,
    this.address,
    this.areaLabel,
    this.city,
    this.state,
    required this.lat,
    required this.lng,
    this.photos = const [],
    this.coverPhotoIndex = 0,
    this.phone,
    this.status = 'active',
    this.bedrooms,
    this.bathrooms,
    this.furnished,
    this.amenities = const [],
    this.openingHours,
    this.services,
    this.viewCount = 0,
    this.ownerVerified = false,
    this.createdAt,
    this.updatedAt,
  });

  static const maxPhotos = 10;

  final String id;
  final String ownerUserId;
  final ListingKind kind;
  final String category;
  final String title;
  final String description;
  final double? price;
  final String currency;
  final ListingPricePeriod? pricePeriod;
  final DateTime? availableFrom;
  final String? address;
  final String? areaLabel;
  final String? city;
  final String? state;
  final double lat;
  final double lng;
  final List<String> photos;
  final int coverPhotoIndex;
  final String? phone;
  final String status;
  final int? bedrooms;
  final int? bathrooms;
  final bool? furnished;
  final List<String> amenities;
  final String? openingHours;
  final String? services;
  final int viewCount;
  final bool ownerVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  int get safeCoverIndex {
    if (photos.isEmpty) return 0;
    if (coverPhotoIndex < 0) return 0;
    if (coverPhotoIndex >= photos.length) return 0;
    return coverPhotoIndex;
  }

  String? get coverPhoto =>
      photos.isEmpty ? null : photos[safeCoverIndex];

  /// Human-readable location for cards and details.
  String get locationLine {
    final parts = <String>[
      if (address != null && address!.trim().isNotEmpty) address!.trim(),
      if (areaLabel != null && areaLabel!.trim().isNotEmpty) areaLabel!.trim(),
      if (city != null && city!.trim().isNotEmpty) city!.trim(),
      if (state != null && state!.trim().isNotEmpty) state!.trim(),
    ];
    return parts.join(', ');
  }

  bool get isProperty =>
      kind == ListingKind.rental || kind == ListingKind.sale;

  factory Listing.fromJson(Map<String, dynamic> json) {
    final owner = json['profiles'] as Map<String, dynamic>?;
    return Listing(
      id: json['id'] as String,
      ownerUserId: json['owner_user_id'] as String,
      kind: ListingKind.fromDb(json['kind'] as String? ?? 'business'),
      category: json['category'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String? ?? 'NGN',
      pricePeriod: ListingPricePeriod.fromDb(json['price_period'] as String?),
      availableFrom: json['available_from'] == null
          ? null
          : DateTime.tryParse(json['available_from'].toString()),
      address: json['address'] as String?,
      areaLabel: json['area_label'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      photos: (json['photos'] as List<dynamic>? ?? [])
          .map((e) => '$e')
          .where((e) => e.isNotEmpty)
          .toList(),
      coverPhotoIndex: (json['cover_photo_index'] as num?)?.toInt() ?? 0,
      phone: json['phone'] as String?,
      status: json['status'] as String? ?? 'active',
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      furnished: json['furnished'] as bool?,
      amenities: (json['amenities'] as List<dynamic>? ?? [])
          .map((e) => '$e')
          .toList(),
      openingHours: json['opening_hours'] as String?,
      services: json['services'] as String?,
      viewCount: (json['view_count'] as num?)?.toInt() ?? 0,
      ownerVerified: owner?['verified'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.tryParse(json['created_at'].toString()),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.tryParse(json['updated_at'].toString()),
    );
  }

  Map<String, dynamic> toInsertJson(String ownerId) => {
        'owner_user_id': ownerId,
        'kind': kind.name,
        'category': category,
        'title': title,
        'description': description,
        'price': price,
        'currency': currency,
        'price_period': pricePeriod?.name,
        'available_from': availableFrom?.toIso8601String().split('T').first,
        'address': address,
        'area_label': areaLabel,
        'city': city,
        'state': state,
        'lat': lat,
        'lng': lng,
        'photos': photos,
        'cover_photo_index': coverPhotoIndex,
        'phone': phone,
        'status': status,
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'furnished': furnished,
        'amenities': amenities,
        'opening_hours': openingHours,
        'services': services,
      };
}

/// Categories available when creating a listing, keyed by kind.
const kListingCategoriesByKind = <ListingKind, List<String>>{
  ListingKind.rental: ['house', 'apartment', 'room', 'duplex', 'land'],
  ListingKind.sale: ['house', 'apartment', 'duplex', 'land', 'shop'],
  ListingKind.business: [
    'restaurant',
    'hotel',
    'shop',
    'pharmacy',
    'bank',
    'school',
    'supermarket',
    'market',
    'fuel',
    'other',
  ],
};

const kPropertyAmenityOptions = <String>[
  'water',
  'electricity',
  'parking',
  'security',
  'generator',
  'water_heater',
  'air_conditioning',
  'fenced',
  'prepaid_meter',
];
