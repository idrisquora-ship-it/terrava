import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/app_preferences.dart';
import '../../core/network/supabase_client.dart';
import '../../features/auth/controllers/auth_controller.dart';
import '../../features/auth/repositories/auth_repository.dart';

class UserPreferences {
  const UserPreferences({
    this.units = 'metric',
    this.locale = 'en',
    this.themeMode = 'system',
    this.pushEnabled = true,
    this.homeCurrency = 'USD',
  });

  final String units;
  final String locale;
  final String themeMode;
  final bool pushEnabled;
  final String homeCurrency;

  UserPreferences copyWith({
    String? units,
    String? locale,
    String? themeMode,
    bool? pushEnabled,
    String? homeCurrency,
  }) {
    return UserPreferences(
      units: units ?? this.units,
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      pushEnabled: pushEnabled ?? this.pushEnabled,
      homeCurrency: homeCurrency ?? this.homeCurrency,
    );
  }
}

final userPreferencesProvider =
    NotifierProvider<UserPreferencesController, UserPreferences>(
  UserPreferencesController.new,
);

class UserPreferencesController extends Notifier<UserPreferences> {
  static const _unitsKey = 'terrava_units';
  static const _localeKey = 'terrava_locale';
  static const _pushKey = 'terrava_push_enabled';
  static const _currencyKey = 'terrava_home_currency';

  @override
  UserPreferences build() {
    final prefs = ref.watch(appPrefsProvider);
    return UserPreferences(
      units: prefs.getString(_unitsKey) ?? 'metric',
      locale: prefs.getString(_localeKey) ?? 'en',
      pushEnabled: prefs.getBool(_pushKey) ?? true,
      homeCurrency: prefs.getString(_currencyKey) ?? 'USD',
    );
  }

  Future<void> setUnits(String units) async {
    state = state.copyWith(units: units);
    await ref.read(appPrefsProvider).setString(_unitsKey, units);
    await _syncProfile({'units': units});
  }

  Future<void> setLocale(String locale) async {
    state = state.copyWith(locale: locale);
    await ref.read(appPrefsProvider).setString(_localeKey, locale);
    await _syncProfile({'locale': locale});
  }

  Future<void> setPushEnabled(bool enabled) async {
    state = state.copyWith(pushEnabled: enabled);
    await ref.read(appPrefsProvider).setBool(_pushKey, enabled);
    await _syncProfile({
      'notification_prefs': {
        'push_enabled': enabled,
        'saved_updates': enabled,
        'tips': enabled,
        'account': enabled,
        'home_currency': state.homeCurrency,
      },
    });
  }

  Future<void> setHomeCurrency(String code) async {
    state = state.copyWith(homeCurrency: code);
    await ref.read(appPrefsProvider).setString(_currencyKey, code);
    await _syncProfile({
      'notification_prefs': {
        'push_enabled': state.pushEnabled,
        'saved_updates': state.pushEnabled,
        'tips': state.pushEnabled,
        'account': state.pushEnabled,
        'home_currency': code,
      },
    });
  }

  Future<void> hydrateFromProfile() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;
    final profile = await ref.read(authRepositoryProvider).fetchProfile();
    if (profile == null) return;
    final units = profile['units'] as String? ?? state.units;
    final locale = profile['locale'] as String? ?? state.locale;
    final notif = profile['notification_prefs'] as Map<String, dynamic>? ?? {};
    final push = notif['push_enabled'] as bool? ?? state.pushEnabled;
    final currency = notif['home_currency'] as String? ?? state.homeCurrency;
    state = state.copyWith(
      units: units,
      locale: locale,
      pushEnabled: push,
      homeCurrency: currency,
    );
    final prefs = ref.read(appPrefsProvider);
    await prefs.setString(_unitsKey, units);
    await prefs.setString(_localeKey, locale);
    await prefs.setBool(_pushKey, push);
    await prefs.setString(_currencyKey, currency);
  }

  Future<void> _syncProfile(Map<String, dynamic> payload) async {
    final client = ref.read(supabaseClientProvider);
    final user = ref.read(currentUserProvider);
    if (client == null || user == null) return;
    try {
      await client.from('profiles').update(payload).eq('id', user.id);
    } catch (_) {}
  }
}
