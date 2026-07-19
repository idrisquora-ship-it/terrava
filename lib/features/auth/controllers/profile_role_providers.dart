import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_role.dart';
import '../repositories/auth_repository.dart';
import 'auth_controller.dart';

/// Current user's profile row (includes role / role_chosen).
final authProfileProvider =
    FutureProvider.autoDispose<Map<String, dynamic>?>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return null;
  return ref.watch(authRepositoryProvider).fetchProfile();
});

final userRoleProvider = Provider.autoDispose<UserRole>((ref) {
  final profile = ref.watch(authProfileProvider).valueOrNull;
  return UserRole.fromDb(profile?['role'] as String?);
});

final isAdminProvider = Provider.autoDispose<bool>((ref) {
  final profile = ref.watch(authProfileProvider).valueOrNull;
  return profile?['is_admin'] == true &&
      (profile?['account_status'] as String? ?? 'active') == 'active';
});

/// Non-null when the signed-in account is suspended, blocked, or deleted.
final accountRestrictionProvider = Provider.autoDispose<String?>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return null;
  final async = ref.watch(authProfileProvider);
  if (async.isLoading) return null;
  final profile = async.valueOrNull;
  final status = profile?['account_status'] as String? ?? 'active';
  if (status == 'active') return null;
  return status;
});

/// True when a signed-in user still needs the one-time role picker.
final needsRolePickerProvider = Provider.autoDispose<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return false;
  final async = ref.watch(authProfileProvider);
  if (async.isLoading) return false;
  final profile = async.valueOrNull;
  if (profile == null) return true;
  return profile['role_chosen'] != true;
});
