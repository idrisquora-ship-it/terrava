import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/supabase_client.dart';
import '../../../core/services/fcm_service.dart';
import '../../../shared/models/place_models.dart';
import '../../auth/controllers/auth_controller.dart';

final favoritesControllerProvider =
    NotifierProvider<FavoritesController, AsyncValue<void>>(
  FavoritesController.new,
);

final savedPlacesProvider = FutureProvider.autoDispose((ref) async {
  final client = ref.watch(supabaseClientProvider);
  final user = ref.watch(currentUserProvider);
  if (client == null || user == null) return <Map<String, dynamic>>[];
  final rows = await client
      .from('saved_places')
      .select()
      .eq('user_id', user.id)
      .order('created_at', ascending: false);
  return List<Map<String, dynamic>>.from(rows);
});

final savedLocationsProvider = FutureProvider.autoDispose((ref) async {
  final client = ref.watch(supabaseClientProvider);
  final user = ref.watch(currentUserProvider);
  if (client == null || user == null) return <Map<String, dynamic>>[];
  final rows = await client
      .from('saved_locations')
      .select()
      .eq('user_id', user.id)
      .order('created_at', ascending: false);
  return List<Map<String, dynamic>>.from(rows);
});

class FavoritesController extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> savePlace(PlaceSummary place) async {
    final client = ref.read(supabaseClientProvider);
    final user = ref.read(currentUserProvider);
    if (client == null || user == null) {
      state = const AsyncError('Sign in to save places', StackTrace.empty);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await client.from('saved_places').upsert({
        'user_id': user.id,
        'place_id': place.placeId,
        'name': place.name,
        'category': place.primaryType,
        'rating': place.rating,
        'address': place.address,
        'lat': place.lat,
        'lng': place.lng,
        'photo_url': place.photoReference,
        'metadata': {'types': place.types},
      }, onConflict: 'user_id,place_id');
      ref.invalidate(savedPlacesProvider);
      await ref.read(fcmServiceProvider).notifyPlaceSaved(place.name);
    });
  }

  Future<void> saveLocation({
    required String label,
    required double lat,
    required double lng,
    String? placeId,
  }) async {
    final client = ref.read(supabaseClientProvider);
    final user = ref.read(currentUserProvider);
    if (client == null || user == null) {
      state = const AsyncError('Sign in to save areas', StackTrace.empty);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await client.from('saved_locations').insert({
        'user_id': user.id,
        'label': label,
        'formatted_address': label,
        'lat': lat,
        'lng': lng,
        'place_id': placeId,
      });
      ref.invalidate(savedLocationsProvider);
      await ref.read(fcmServiceProvider).notifyLocationSaved(label);
    });
  }

  Future<void> removePlace(String placeId) async {
    final client = ref.read(supabaseClientProvider);
    final user = ref.read(currentUserProvider);
    if (client == null || user == null) return;
    await client
        .from('saved_places')
        .delete()
        .eq('user_id', user.id)
        .eq('place_id', placeId);
    ref.invalidate(savedPlacesProvider);
  }
}
