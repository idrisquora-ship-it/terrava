import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_client.dart';
import '../models/listing.dart';

final listingsRepositoryProvider = Provider<ListingsRepository>((ref) {
  return ListingsRepository(ref.watch(supabaseClientProvider));
});

class ListingAlert {
  const ListingAlert({
    required this.id,
    this.query,
    this.city,
    this.areaLabel,
    this.kind,
    this.category,
    this.maxPrice,
    this.radiusKm = 25,
    this.active = true,
  });

  final String id;
  final String? query;
  final String? city;
  final String? areaLabel;
  final String? kind;
  final String? category;
  final double? maxPrice;
  final double radiusKm;
  final bool active;

  factory ListingAlert.fromJson(Map<String, dynamic> json) {
    return ListingAlert(
      id: json['id'] as String,
      query: json['query'] as String?,
      city: json['city'] as String?,
      areaLabel: json['area_label'] as String?,
      kind: json['kind'] as String?,
      category: json['category'] as String?,
      maxPrice: (json['max_price'] as num?)?.toDouble(),
      radiusKm: (json['radius_km'] as num?)?.toDouble() ?? 25,
      active: json['active'] as bool? ?? true,
    );
  }
}

class OwnerDashboardStats {
  const OwnerDashboardStats({
    required this.listingCount,
    required this.activeCount,
    required this.totalViews,
    required this.messageThreads,
  });

  final int listingCount;
  final int activeCount;
  final int totalViews;
  final int messageThreads;
}

class ListingsRepository {
  ListingsRepository(this._client);

  final SupabaseClient? _client;

  static const _selectWithOwner = '*';

  Listing _mapRow(Map<String, dynamic> row, {bool verified = false}) {
    final mapped = Map<String, dynamic>.from(row);
    mapped['profiles'] = {'verified': verified};
    return Listing.fromJson(mapped);
  }

  Future<Map<String, bool>> _verifiedMap(Iterable<String> ownerIds) async {
    final ids = ownerIds.toSet().toList();
    if (ids.isEmpty) return {};
    final rows = await _db
        .from('profiles')
        .select('id, verified')
        .inFilter('id', ids);
    return {
      for (final r in rows)
        r['id'] as String: r['verified'] as bool? ?? false,
    };
  }

  Future<List<Listing>> _mapRows(List<dynamic> rows) async {
    final maps = rows.map((r) => Map<String, dynamic>.from(r as Map)).toList();
    final verified = await _verifiedMap(maps.map((m) => m['owner_user_id'] as String));
    return maps
        .map(
          (m) => _mapRow(
            m,
            verified: verified[m['owner_user_id'] as String] ?? false,
          ),
        )
        .toList();
  }

  SupabaseClient get _db {
    final c = _client;
    if (c == null) {
      throw StateError('Supabase is not configured');
    }
    return c;
  }

  Future<List<Listing>> search({
    String? query,
    String? area,
    String? city,
    String? state,
    ListingKind? kind,
    String? category,
    double? minPrice,
    double? maxPrice,
    double? nearLat,
    double? nearLng,
    double radiusKm = 25,
    int limit = 40,
  }) async {
    var builder =
        _db.from('listings').select(_selectWithOwner).eq('status', 'active');

    if (kind != null) builder = builder.eq('kind', kind.name);
    if (category != null && category.isNotEmpty) {
      builder = builder.eq('category', category);
    }
    if (city != null && city.trim().isNotEmpty) {
      builder = builder.ilike('city', '%${city.trim()}%');
    }
    if (state != null && state.trim().isNotEmpty) {
      builder = builder.ilike('state', '%${state.trim()}%');
    }
    if (area != null && area.trim().isNotEmpty) {
      final a = area.trim();
      builder = builder.or(
        'area_label.ilike.%$a%,city.ilike.%$a%,title.ilike.%$a%,'
        'address.ilike.%$a%,state.ilike.%$a%',
      );
    }
    if (query != null && query.trim().isNotEmpty) {
      final q = query.trim();
      builder = builder.or(
        'title.ilike.%$q%,description.ilike.%$q%,category.ilike.%$q%,'
        'area_label.ilike.%$q%,city.ilike.%$q%,kind.ilike.%$q%,'
        'services.ilike.%$q%,address.ilike.%$q%,state.ilike.%$q%',
      );
    }
    if (minPrice != null) builder = builder.gte('price', minPrice);
    if (maxPrice != null) builder = builder.lte('price', maxPrice);

    final rows =
        await builder.order('created_at', ascending: false).limit(limit);
    var listings = await _mapRows(rows);

    if (nearLat != null && nearLng != null) {
      listings = listings.where((l) {
        final d = _haversineKm(nearLat, nearLng, l.lat, l.lng);
        return d <= radiusKm;
      }).toList()
        ..sort((a, b) {
          final da = _haversineKm(nearLat, nearLng, a.lat, a.lng);
          final db = _haversineKm(nearLat, nearLng, b.lat, b.lng);
          return da.compareTo(db);
        });
    }
    return listings;
  }

  Future<List<Listing>> nearby({
    required double lat,
    required double lng,
    double radiusKm = 8,
    ListingKind? kind,
    String? category,
    int limit = 40,
  }) {
    return search(
      nearLat: lat,
      nearLng: lng,
      radiusKm: radiusKm,
      kind: kind,
      category: category,
      limit: limit,
    );
  }

  Future<List<Listing>> mine() async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) return [];
    final rows = await _db
        .from('listings')
        .select(_selectWithOwner)
        .eq('owner_user_id', uid)
        .order('created_at', ascending: false);
    return _mapRows(rows);
  }

  Future<Listing?> byId(String id) async {
    final rows = await _db
        .from('listings')
        .select(_selectWithOwner)
        .eq('id', id)
        .limit(1);
    if (rows.isEmpty) return null;
    final list = await _mapRows(rows);
    return list.first;
  }

  Future<void> recordView(String id) async {
    try {
      await _db.rpc('increment_listing_views', params: {'p_listing_id': id});
    } catch (_) {}
  }

  Future<Listing> create(Listing draft) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    final row = await _db
        .from('listings')
        .insert(draft.toInsertJson(uid))
        .select(_selectWithOwner)
        .single();
    final list = await _mapRows([row]);
    return list.first;
  }

  Future<Listing> update(String id, Map<String, dynamic> patch) async {
    patch['updated_at'] = DateTime.now().toIso8601String();
    final row = await _db
        .from('listings')
        .update(patch)
        .eq('id', id)
        .select(_selectWithOwner)
        .single();
    final list = await _mapRows([row]);
    return list.first;
  }

  Future<void> delete(String id) async {
    await _db.from('listings').delete().eq('id', id);
  }

  Future<void> reportListing({
    required String listingId,
    required String reason,
  }) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    await _db.from('listing_reports').insert({
      'listing_id': listingId,
      'reporter_id': uid,
      'reason': reason.trim(),
    });
  }

  Future<String> uploadPhoto({
    required String listingId,
    required Uint8List bytes,
    String ext = 'jpg',
  }) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    final normalized = ext.toLowerCase().replaceAll('.', '');
    final contentType = switch (normalized) {
      'png' => 'image/png',
      'webp' => 'image/webp',
      _ => 'image/jpeg',
    };
    final path =
        '$uid/$listingId/${DateTime.now().millisecondsSinceEpoch}.$normalized';
    await _db.storage.from('listing-images').uploadBinary(
          path,
          bytes,
          fileOptions: FileOptions(upsert: true, contentType: contentType),
        );
    return _db.storage.from('listing-images').getPublicUrl(path);
  }

  Future<bool> isSaved(String listingId) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) return false;
    final rows = await _db
        .from('saved_listings')
        .select('id')
        .eq('user_id', uid)
        .eq('listing_id', listingId)
        .limit(1);
    return rows.isNotEmpty;
  }

  Future<void> saveListing(String listingId) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    await _db.from('saved_listings').upsert({
      'user_id': uid,
      'listing_id': listingId,
    });
  }

  Future<void> unsaveListing(String listingId) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) return;
    await _db
        .from('saved_listings')
        .delete()
        .eq('user_id', uid)
        .eq('listing_id', listingId);
  }

  Future<List<Listing>> savedListings() async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) return [];
    final rows = await _db
        .from('saved_listings')
        .select('listing_id, listings(*)')
        .eq('user_id', uid)
        .order('created_at', ascending: false);
    final listingMaps = <Map<String, dynamic>>[];
    for (final r in rows) {
      final listing = r['listings'];
      if (listing is Map) {
        listingMaps.add(Map<String, dynamic>.from(listing));
      }
    }
    return _mapRows(listingMaps);
  }

  Future<List<ListingAlert>> myAlerts() async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) return [];
    final rows = await _db
        .from('listing_alerts')
        .select()
        .eq('user_id', uid)
        .order('created_at', ascending: false);
    return rows
        .map((r) => ListingAlert.fromJson(Map<String, dynamic>.from(r)))
        .toList();
  }

  Future<ListingAlert> createAlert({
    String? query,
    String? city,
    String? areaLabel,
    String? kind,
    String? category,
    double? maxPrice,
    double radiusKm = 25,
  }) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    final row = await _db
        .from('listing_alerts')
        .insert({
          'user_id': uid,
          'query': query,
          'city': city,
          'area_label': areaLabel,
          'kind': kind,
          'category': category,
          'max_price': maxPrice,
          'radius_km': radiusKm,
        })
        .select()
        .single();
    return ListingAlert.fromJson(Map<String, dynamic>.from(row));
  }

  Future<void> deleteAlert(String id) async {
    await _db.from('listing_alerts').delete().eq('id', id);
  }

  Future<OwnerDashboardStats> ownerStats() async {
    final listings = await mine();
    final uid = _db.auth.currentUser?.id;
    var threads = 0;
    if (uid != null && listings.isNotEmpty) {
      final ids = listings.map((l) => l.id).toList();
      final convos = await _db
          .from('conversations')
          .select('id')
          .inFilter('listing_id', ids);
      threads = convos.length;
    }
    return OwnerDashboardStats(
      listingCount: listings.length,
      activeCount: listings.where((l) => l.status == 'active').length,
      totalViews: listings.fold<int>(0, (sum, l) => sum + l.viewCount),
      messageThreads: threads,
    );
  }

  static double _haversineKm(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const r = 6371.0;
    double rad(double d) => d * math.pi / 180;
    final dLat = rad(lat2 - lat1);
    final dLon = rad(lon2 - lon1);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(rad(lat1)) *
            math.cos(rad(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    return 2 * r * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  }
}
