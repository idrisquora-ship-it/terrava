import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/app_preferences.dart';
import '../../core/network/supabase_client.dart';
import '../../features/auth/controllers/auth_controller.dart';

final historyRepositoryProvider = Provider((ref) => HistoryRepository(ref));

final recentSearchesProvider =
    FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
  return ref.watch(historyRepositoryProvider).recentSearches();
});

final popularSearchesProvider =
    FutureProvider.autoDispose<List<String>>((ref) async {
  return ref.watch(historyRepositoryProvider).popularSearches();
});

final recentlyViewedProvider =
    FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
  return ref.watch(historyRepositoryProvider).recentlyViewed();
});

class HistoryRepository {
  HistoryRepository(this._ref);
  final Ref _ref;

  static const _localRecentSearches = 'terrava_local_recent_searches';
  static const _localRecentlyViewed = 'terrava_local_recently_viewed';

  Future<List<Map<String, dynamic>>> recentSearches() async {
    final client = _ref.read(supabaseClientProvider);
    final user = _ref.read(currentUserProvider);
    if (client != null && user != null) {
      final rows = await client
          .from('search_history')
          .select()
          .eq('user_id', user.id)
          .order('created_at', ascending: false)
          .limit(20);
      return List<Map<String, dynamic>>.from(rows);
    }
    return _readLocalList(_localRecentSearches);
  }

  Future<List<String>> popularSearches() async {
    final client = _ref.read(supabaseClientProvider);
    if (client != null) {
      try {
        final rows = await client
            .from('popular_searches')
            .select('query,weight')
            .eq('is_active', true)
            .order('weight', ascending: false)
            .limit(12);
        final list = List<Map<String, dynamic>>.from(rows)
            .map((e) => e['query'] as String)
            .where((q) => q.trim().isNotEmpty)
            .toList();
        if (list.isNotEmpty) return list;
      } catch (_) {}
    }
    // Fall back to the user's own most frequent recent searches (real data only).
    final recent = await recentSearches();
    final counts = <String, int>{};
    for (final row in recent) {
      final q = (row['query'] as String? ?? '').trim();
      if (q.isEmpty) continue;
      counts[q] = (counts[q] ?? 0) + 1;
    }
    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted.take(8).map((e) => e.key).toList();
  }

  Future<void> addSearch({
    required String query,
    double? lat,
    double? lng,
    String? resultPlaceId,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    final client = _ref.read(supabaseClientProvider);
    final user = _ref.read(currentUserProvider);
    if (client != null && user != null) {
      await client.from('search_history').insert({
        'user_id': user.id,
        'query': trimmed,
        'lat': lat,
        'lng': lng,
        'result_place_id': resultPlaceId,
      });
      _ref.invalidate(recentSearchesProvider);
      _ref.invalidate(popularSearchesProvider);
      return;
    }

    final local = await _readLocalList(_localRecentSearches);
    local.removeWhere((e) => e['query'] == trimmed);
    local.insert(0, {
      'query': trimmed,
      'lat': lat,
      'lng': lng,
      'created_at': DateTime.now().toIso8601String(),
    });
    await _writeLocalList(_localRecentSearches, local.take(30).toList());
    _ref.invalidate(recentSearchesProvider);
  }

  Future<List<Map<String, dynamic>>> recentlyViewed() async {
    final client = _ref.read(supabaseClientProvider);
    final user = _ref.read(currentUserProvider);
    if (client != null && user != null) {
      final rows = await client
          .from('recently_viewed')
          .select()
          .eq('user_id', user.id)
          .order('viewed_at', ascending: false)
          .limit(30);
      return List<Map<String, dynamic>>.from(rows);
    }
    return _readLocalList(_localRecentlyViewed);
  }

  Future<void> trackView({
    required String itemType,
    required String label,
    String? placeId,
    double? lat,
    double? lng,
    String? photoUrl,
  }) async {
    final client = _ref.read(supabaseClientProvider);
    final user = _ref.read(currentUserProvider);
    final payload = {
      'item_type': itemType,
      'label': label,
      'place_id': placeId,
      'lat': lat,
      'lng': lng,
      'photo_url': photoUrl,
      'viewed_at': DateTime.now().toIso8601String(),
    };

    if (client != null && user != null) {
      await client.from('recently_viewed').insert({
        ...payload,
        'user_id': user.id,
      });
      // Keep table lean
      final old = await client
          .from('recently_viewed')
          .select('id')
          .eq('user_id', user.id)
          .order('viewed_at', ascending: false)
          .range(50, 200);
      final ids = List<Map<String, dynamic>>.from(old)
          .map((e) => e['id'] as String)
          .toList();
      if (ids.isNotEmpty) {
        await client.from('recently_viewed').delete().inFilter('id', ids);
      }
      _ref.invalidate(recentlyViewedProvider);
      return;
    }

    final local = await _readLocalList(_localRecentlyViewed);
    local.insert(0, payload);
    await _writeLocalList(_localRecentlyViewed, local.take(30).toList());
    _ref.invalidate(recentlyViewedProvider);
  }

  Future<List<Map<String, dynamic>>> _readLocalList(String key) async {
    final raw = _ref.read(appPrefsProvider).getString(key);
    if (raw == null || raw.isEmpty) return [];
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded.cast<Map<String, dynamic>>();
  }

  Future<void> _writeLocalList(
    String key,
    List<Map<String, dynamic>> rows,
  ) async {
    await _ref.read(appPrefsProvider).setString(key, jsonEncode(rows));
  }
}
