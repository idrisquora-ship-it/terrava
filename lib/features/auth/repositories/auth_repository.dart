import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/config/env.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/supabase_client.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(supabaseClientProvider));
});

class AuthRepository {
  AuthRepository(this._client);

  final SupabaseClient? _client;

  GoogleSignIn? _googleSignIn;

  GoogleSignIn get _google {
    final clientId = Env.googleOauthClientId;
    // Web needs [clientId] (also mirrored in web/index.html meta tag).
    // Android/iOS use [serverClientId] so the ID token audience matches Supabase.
    return _googleSignIn ??= GoogleSignIn(
      clientId: kIsWeb && clientId.isNotEmpty ? clientId : null,
      serverClientId: !kIsWeb && clientId.isNotEmpty ? clientId : null,
      scopes: const ['email', 'profile'],
    );
  }

  SupabaseClient get _requireClient {
    final client = _client;
    if (client == null) {
      throw const AuthFailure(
        'Supabase is not configured. Check SUPABASE_URL and SUPABASE_ANON_KEY.',
      );
    }
    return client;
  }

  Session? get currentSession => _client?.auth.currentSession;
  User? get currentUser => _client?.auth.currentUser;
  Stream<AuthState> get authStateChanges {
    final client = _client;
    if (client == null) return const Stream.empty();
    return client.auth.onAuthStateChange;
  }

  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _requireClient.auth.signInWithPassword(
        email: email.trim(),
        password: password,
      );
      await _syncProfileFromAuthUser(response.user);
      return response;
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    } catch (_) {
      throw const AuthFailure('Unable to sign in. Please try again.');
    }
  }

  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    String? displayName,
    String role = 'civilian',
  }) async {
    try {
      final normalizedRole =
          role == 'business_owner' ? 'business_owner' : 'civilian';
      final response = await _requireClient.auth.signUp(
        email: email.trim(),
        password: password,
        data: {
          if (displayName != null && displayName.trim().isNotEmpty)
            'full_name': displayName.trim(),
          'role': normalizedRole,
        },
      );
      await _syncProfileFromAuthUser(
        response.user,
        role: normalizedRole,
        roleChosen: true,
      );
      return response;
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    } catch (_) {
      throw const AuthFailure('Unable to create account. Please try again.');
    }
  }

  Future<void> sendPasswordReset(String email) async {
    try {
      await _requireClient.auth.resetPasswordForEmail(
        email.trim(),
        redirectTo: Env.authRedirectUrl,
      );
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    } catch (_) {
      throw const AuthFailure('Unable to send reset email.');
    }
  }

  Future<AuthResponse> signInWithGoogle() async {
    if (!Env.hasValidGoogleOauthConfig) {
      throw const AuthFailure(
        'GOOGLE_OAUTH_CLIENT_ID is missing or invalid. Put your Web client ID in .env '
        '(…apps.googleusercontent.com).',
      );
    }
    try {
      // Clear a stale Google session so account picker / fresh tokens work.
      await _google.signOut();
      final account = await _google.signIn();
      if (account == null) {
        throw const AuthFailure('Google sign-in cancelled.');
      }
      final auth = await account.authentication;
      final idToken = auth.idToken;
      if (idToken == null) {
        throw const AuthFailure(
          'Missing Google ID token. Confirm GOOGLE_OAUTH_CLIENT_ID is the Web '
          'client ID and the Android OAuth client uses com.terrava.terrava + SHA-1.',
        );
      }
      final response = await _requireClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: auth.accessToken,
      );
      await _syncProfileFromAuthUser(response.user);
      return response;
    } on AuthFailure {
      rethrow;
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    } on PlatformException catch (e) {
      throw AuthFailure(_mapGooglePlatformError(e));
    } catch (_) {
      throw const AuthFailure('Google sign-in failed. Please try again.');
    }
  }

  Future<AuthResponse> signInWithApple() async {
    if (!Env.enableAppleSignIn) {
      throw const AuthFailure('Apple Sign-In is not enabled yet.');
    }
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final idToken = credential.identityToken;
      if (idToken == null) {
        throw const AuthFailure('Missing Apple identity token.');
      }
      final response = await _requireClient.auth.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
      );
      await _syncProfileFromAuthUser(response.user);
      return response;
    } on AuthFailure {
      rethrow;
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    } catch (_) {
      throw const AuthFailure('Apple sign-in failed.');
    }
  }

  Future<void> signOut() async {
    try {
      await _google.signOut();
    } catch (_) {}
    await _client?.auth.signOut();
  }

  Future<Map<String, dynamic>?> fetchProfile() async {
    final user = currentUser;
    if (user == null) return null;
    final rows = await _requireClient
        .from('profiles')
        .select()
        .eq('id', user.id)
        .limit(1);
    if (rows.isEmpty) return null;
    return Map<String, dynamic>.from(rows.first);
  }

  Future<void> updateProfile({
    String? displayName,
    String? themeMode,
    String? units,
    String? locale,
    String? fcmToken,
    String? avatarUrl,
    String? role,
    bool? roleChosen,
  }) async {
    final user = currentUser;
    if (user == null) return;
    final payload = <String, dynamic>{
      if (displayName != null) 'display_name': displayName,
      if (themeMode != null) 'theme_mode': themeMode,
      if (units != null) 'units': units,
      if (locale != null) 'locale': locale,
      if (fcmToken != null) 'fcm_token': fcmToken,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (role != null) 'role': role,
      if (roleChosen != null) 'role_chosen': roleChosen,
      'updated_at': DateTime.now().toIso8601String(),
    };
    await _requireClient.from('profiles').update(payload).eq('id', user.id);
  }

  /// One-time role selection for Google / social sign-in users.
  Future<void> chooseRole(String role) async {
    final normalized =
        role == 'business_owner' ? 'business_owner' : 'civilian';
    await updateProfile(role: normalized, roleChosen: true);
  }

  Future<void> clearFcmToken() async {
    final user = currentUser;
    if (user == null) return;
    await _requireClient.from('profiles').update({
      'fcm_token': null,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', user.id);
  }

  Future<String> uploadAvatar(Uint8List bytes, {String ext = 'jpg'}) async {
    final user = currentUser;
    if (user == null) {
      throw const AuthFailure('Sign in required');
    }
    final normalizedExt = ext.toLowerCase().replaceAll('.', '');
    final contentType = switch (normalizedExt) {
      'png' => 'image/png',
      'webp' => 'image/webp',
      _ => 'image/jpeg',
    };
    final path = '${user.id}/avatar.$normalizedExt';
    try {
      await _requireClient.storage.from('avatars').uploadBinary(
            path,
            bytes,
            fileOptions: FileOptions(
              upsert: true,
              contentType: contentType,
            ),
          );
    } on StorageException catch (e) {
      // If an old object blocks overwrite, remove then upload once.
      if (e.statusCode == '403' || e.statusCode == '409') {
        try {
          await _requireClient.storage.from('avatars').remove([path]);
        } catch (_) {}
        await _requireClient.storage.from('avatars').uploadBinary(
              path,
              bytes,
              fileOptions: FileOptions(
                upsert: true,
                contentType: contentType,
              ),
            );
      } else {
        rethrow;
      }
    }
    final url = _requireClient.storage.from('avatars').getPublicUrl(path);
    final cacheBusted =
        '$url?v=${DateTime.now().millisecondsSinceEpoch}';
    await updateProfile(avatarUrl: cacheBusted);
    return cacheBusted;
  }

  Future<void> deleteAccount() async {
    final client = _requireClient;
    final session = client.auth.currentSession;
    if (session == null) {
      throw const AuthFailure('Not signed in');
    }
    final response = await client.functions.invoke(
      'delete-account',
      method: HttpMethod.post,
    );
    if (response.status != 200) {
      throw AuthFailure(
        response.data?.toString() ?? 'Unable to delete account',
      );
    }
    await signOut();
  }

  /// Ensures a profiles row exists and picks up Google name/photo when missing.
  Future<void> _syncProfileFromAuthUser(
    User? user, {
    String? role,
    bool? roleChosen,
  }) async {
    if (user == null) return;
    try {
      final meta = user.userMetadata ?? const <String, dynamic>{};
      final displayName = (meta['full_name'] ??
              meta['name'] ??
              meta['display_name'] ??
              user.email?.split('@').first)
          ?.toString();
      final avatarUrl =
          (meta['avatar_url'] ?? meta['picture'] ?? meta['avatar'])?.toString();
      final metaRole = meta['role']?.toString();

      await _requireClient.from('profiles').upsert({
        'id': user.id,
        if (displayName != null && displayName.isNotEmpty)
          'display_name': displayName,
        if (avatarUrl != null && avatarUrl.isNotEmpty) 'avatar_url': avatarUrl,
        if (role != null) 'role': role,
        if (role == null &&
            (metaRole == 'civilian' || metaRole == 'business_owner'))
          'role': metaRole,
        if (roleChosen != null) 'role_chosen': roleChosen,
        'updated_at': DateTime.now().toIso8601String(),
      });
    } catch (_) {
      // Profile sync must not block sign-in; trigger usually handles insert.
    }
  }

  String _mapGooglePlatformError(PlatformException e) {
    final code = e.code;
    final message = e.message ?? '';
    if (code == 'sign_in_canceled' || message.contains('canceled')) {
      return 'Google sign-in cancelled.';
    }
    // ApiException: 10 = DEVELOPER_ERROR (SHA-1 / package / client ID mismatch)
    if (message.contains('ApiException: 10') || message.contains(': 10:')) {
      return 'Google Sign-In config error (code 10). Check Android OAuth client '
          'package com.terrava.terrava, debug SHA-1, and Web client ID in .env.';
    }
    if (message.contains('ApiException: 7') || message.contains('NETWORK')) {
      return 'Network error during Google sign-in. Check your connection.';
    }
    if (message.contains('ApiException: 12500')) {
      return 'Google Sign-In failed on this device. Try again or use email.';
    }
    return message.isEmpty ? 'Google sign-in failed.' : message;
  }
}
