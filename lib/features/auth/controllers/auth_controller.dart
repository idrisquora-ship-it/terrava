import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories/auth_repository.dart';

class AuthUiState {
  const AuthUiState({
    this.isLoading = false,
    this.errorMessage,
    this.infoMessage,
  });

  final bool isLoading;
  final String? errorMessage;
  final String? infoMessage;

  AuthUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? infoMessage,
    bool clearError = false,
    bool clearInfo = false,
  }) {
    return AuthUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      infoMessage: clearInfo ? null : (infoMessage ?? this.infoMessage),
    );
  }
}

final authSessionProvider = StreamProvider<Session?>((ref) async* {
  final repo = ref.watch(authRepositoryProvider);
  yield repo.currentSession;
  await for (final event in repo.authStateChanges) {
    yield event.session;
  }
});

final currentUserProvider = Provider<User?>((ref) {
  final session = ref.watch(authSessionProvider).valueOrNull;
  return session?.user ?? ref.watch(authRepositoryProvider).currentUser;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(currentUserProvider) != null;
});

final authControllerProvider =
    NotifierProvider<AuthController, AuthUiState>(AuthController.new);

class AuthController extends Notifier<AuthUiState> {
  AuthRepository get _repo => ref.read(authRepositoryProvider);

  @override
  AuthUiState build() => const AuthUiState();

  Future<bool> signIn({required String email, required String password}) async {
    return _run(() => _repo.signInWithEmail(email: email, password: password));
  }

  Future<bool> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    return _run(
      () => _repo.signUpWithEmail(
        email: email,
        password: password,
        displayName: displayName,
      ),
    );
  }

  Future<bool> signInWithGoogle() async {
    return _run(_repo.signInWithGoogle);
  }

  Future<bool> signInWithApple() async {
    return _run(_repo.signInWithApple);
  }

  Future<bool> sendPasswordReset(String email) async {
    state = state.copyWith(isLoading: true, clearError: true, clearInfo: true);
    try {
      await _repo.sendPasswordReset(email);
      state = state.copyWith(
        isLoading: false,
        infoMessage: 'Password reset email sent. Check your inbox.',
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      await _repo.clearFcmToken();
    } catch (_) {}
    try {
      await FirebaseMessaging.instance.deleteToken();
    } catch (_) {}
    await _repo.signOut();
  }

  Future<bool> deleteAccount() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _repo.deleteAccount();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }

  Future<bool> _run(Future<dynamic> Function() action) async {
    state = state.copyWith(isLoading: true, clearError: true, clearInfo: true);
    try {
      await action();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }
}
