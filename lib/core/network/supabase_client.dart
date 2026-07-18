import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../config/env.dart';

final supabaseInitializedProvider = Provider<bool>((ref) {
  throw UnimplementedError(
    'supabaseInitializedProvider must be overridden in main.dart',
  );
});

final supabaseClientProvider = Provider<SupabaseClient?>((ref) {
  if (!ref.watch(supabaseInitializedProvider)) return null;
  return Supabase.instance.client;
});

/// Initializes Supabase only when env values look real.
Future<bool> initializeSupabaseIfConfigured() async {
  if (!Env.hasValidSupabaseConfig) {
    return false;
  }

  await Supabase.initialize(
    url: Env.supabaseUrl,
    publishableKey: Env.supabaseAnonKey,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
  );
  return true;
}
