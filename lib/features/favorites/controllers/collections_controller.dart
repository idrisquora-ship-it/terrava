import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/supabase_client.dart';
import '../../auth/controllers/auth_controller.dart';

final collectionsProvider =
    FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
  final client = ref.watch(supabaseClientProvider);
  final user = ref.watch(currentUserProvider);
  if (client == null || user == null) return [];
  final rows = await client
      .from('collections')
      .select()
      .eq('user_id', user.id)
      .order('updated_at', ascending: false);
  return List<Map<String, dynamic>>.from(rows);
});

final collectionItemsProvider = FutureProvider.autoDispose
    .family<List<Map<String, dynamic>>, String>((ref, collectionId) async {
  final client = ref.watch(supabaseClientProvider);
  final user = ref.watch(currentUserProvider);
  if (client == null || user == null) return [];
  final rows = await client
      .from('collection_items')
      .select()
      .eq('collection_id', collectionId)
      .eq('user_id', user.id)
      .order('created_at', ascending: false);
  return List<Map<String, dynamic>>.from(rows);
});

final collectionsControllerProvider =
    Provider((ref) => CollectionsController(ref));

class CollectionsController {
  CollectionsController(this._ref);
  final Ref _ref;

  Future<void> createCollection(String name, {String? description}) async {
    final client = _ref.read(supabaseClientProvider);
    final user = _ref.read(currentUserProvider);
    if (client == null || user == null) {
      throw Exception('Sign in to create collections');
    }
    await client.from('collections').insert({
      'user_id': user.id,
      'name': name.trim(),
      'description': description,
    });
    _ref.invalidate(collectionsProvider);
  }

  Future<void> renameCollection(String id, String name) async {
    final client = _ref.read(supabaseClientProvider);
    final user = _ref.read(currentUserProvider);
    if (client == null || user == null) return;
    await client.from('collections').update({
      'name': name.trim(),
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', id).eq('user_id', user.id);
    _ref.invalidate(collectionsProvider);
  }

  Future<void> deleteCollection(String id) async {
    final client = _ref.read(supabaseClientProvider);
    final user = _ref.read(currentUserProvider);
    if (client == null || user == null) return;
    await client
        .from('collections')
        .delete()
        .eq('id', id)
        .eq('user_id', user.id);
    _ref.invalidate(collectionsProvider);
  }

  Future<void> addPlace({
    required String collectionId,
    required String placeId,
  }) async {
    final client = _ref.read(supabaseClientProvider);
    final user = _ref.read(currentUserProvider);
    if (client == null || user == null) {
      throw Exception('Sign in required');
    }
    await client.from('collection_items').insert({
      'collection_id': collectionId,
      'user_id': user.id,
      'item_type': 'place',
      'place_id': placeId,
    });
    _ref.invalidate(collectionItemsProvider(collectionId));
  }

  Future<void> addLocation({
    required String collectionId,
    required String savedLocationId,
  }) async {
    final client = _ref.read(supabaseClientProvider);
    final user = _ref.read(currentUserProvider);
    if (client == null || user == null) {
      throw Exception('Sign in required');
    }
    await client.from('collection_items').insert({
      'collection_id': collectionId,
      'user_id': user.id,
      'item_type': 'location',
      'saved_location_id': savedLocationId,
    });
    _ref.invalidate(collectionItemsProvider(collectionId));
  }

  Future<void> removeItem(String itemId, String collectionId) async {
    final client = _ref.read(supabaseClientProvider);
    final user = _ref.read(currentUserProvider);
    if (client == null || user == null) return;
    await client
        .from('collection_items')
        .delete()
        .eq('id', itemId)
        .eq('user_id', user.id);
    _ref.invalidate(collectionItemsProvider(collectionId));
  }
}
