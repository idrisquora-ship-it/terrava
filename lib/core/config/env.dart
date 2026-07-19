import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Typed access to environment variables loaded via flutter_dotenv.
class Env {
  Env._();

  static String _read(String key, {String fallback = ''}) {
    return dotenv.env[key]?.trim() ?? fallback;
  }

  /// Prefer Flutter keys; accept legacy Expo-style keys if present.
  static String _readAlias(String primary, List<String> aliases) {
    final direct = _read(primary);
    if (direct.isNotEmpty) return direct;
    for (final alias in aliases) {
      final value = _read(alias);
      if (value.isNotEmpty) return value;
    }
    return '';
  }

  static String get appEnv => _read('APP_ENV', fallback: 'development');
  static String get appName => _read('APP_NAME', fallback: 'Terrava');

  static String get supabaseUrl => _readAlias(
        'SUPABASE_URL',
        const ['EXPO_PUBLIC_SUPABASE_URL'],
      );

  static String get supabaseAnonKey => _readAlias(
        'SUPABASE_ANON_KEY',
        const ['EXPO_PUBLIC_SUPABASE_ANON_KEY'],
      );

  /// Mapbox public access token (maps tiles, geocoding, directions).
  static String get mapboxAccessToken => _readAlias(
        'MAPBOX_ACCESS_TOKEN',
        const [
          'MAPBOX_PUBLIC_TOKEN',
          'EXPO_PUBLIC_MAPBOX_ACCESS_TOKEN',
        ],
      );

  /// Foursquare Places API key (nearby search + place details).
  static String get foursquareApiKey => _readAlias(
        'FOURSQUARE_API_KEY',
        const ['EXPO_PUBLIC_FOURSQUARE_API_KEY'],
      );

  /// Optional same-origin / custom proxy base for Foursquare Places
  /// (e.g. `https://terrava-nine.vercel.app/api/fsq/places`).
  /// Used to avoid browser CORS failures against places-api.foursquare.com.
  static String get foursquareProxyBase =>
      _read('FOURSQUARE_PROXY_BASE').replaceAll(RegExp(r'/+$'), '');

  /// Public website origin (used to build a Foursquare proxy fallback on mobile).
  static String get appWebUrl => _readAlias(
        'APP_WEB_URL',
        const ['WEB_AUTH_REDIRECT_URL'],
      ).replaceAll(RegExp(r'/+$'), '');

  static String get googleOauthClientId => _readAlias(
        'GOOGLE_OAUTH_CLIENT_ID',
        const [
          'EXPO_PUBLIC_GOOGLE_CLIENT_ID',
          'GOOGLE_CLIENT_ID',
        ],
      );

  static String get weatherApiKey => _readAlias(
        'WEATHER_API_KEY',
        const ['EXPO_PUBLIC_WEATHER_API_KEY'],
      );

  static String get exchangeRateApiKey => _readAlias(
        'EXCHANGE_RATE_API_KEY',
        const ['EXPO_PUBLIC_EXCHANGE_RATE_API_KEY'],
      );

  static bool get enableAppleSignIn =>
      _read('ENABLE_APPLE_SIGN_IN', fallback: 'false').toLowerCase() == 'true';

  static bool get enableVoiceSearch =>
      _read('ENABLE_VOICE_SEARCH', fallback: 'false').toLowerCase() == 'true';

  static bool get enableAiSummary =>
      _read('ENABLE_AI_SUMMARY', fallback: 'false').toLowerCase() == 'true';

  static String get sentryDsn => _read('SENTRY_DSN');

  /// Deep link / URL used for password-reset emails and browser OAuth callbacks.
  static String get authRedirectUrl {
    if (kIsWeb) {
      final web = _read('WEB_AUTH_REDIRECT_URL');
      if (web.isNotEmpty) return web;
      return Uri.base.origin.endsWith('/')
          ? Uri.base.origin
          : '${Uri.base.origin}/';
    }
    return _read(
      'AUTH_REDIRECT_URL',
      fallback: 'com.terrava.terrava://login-callback/',
    );
  }

  static bool get hasValidGoogleOauthConfig {
    final id = googleOauthClientId;
    return id.isNotEmpty &&
        !id.contains('YOUR_GOOGLE') &&
        id.contains('.apps.googleusercontent.com');
  }

  static bool get hasValidMapboxConfig {
    final t = mapboxAccessToken;
    return t.isNotEmpty && !t.contains('YOUR_MAPBOX') && t.startsWith('pk.');
  }

  static bool get hasValidFoursquareConfig {
    final k = foursquareApiKey;
    if (k.isEmpty) return false;
    if (k.contains('YOUR_FOURSQUARE')) return false;
    if (k.toLowerCase() == 'places api key') return false;
    // Real service keys are long opaque strings, not short labels.
    return k.length >= 20;
  }

  static bool get hasValidSupabaseConfig {
    final url = supabaseUrl;
    final key = supabaseAnonKey;
    if (url.isEmpty || key.isEmpty) return false;
    if (url.contains('YOUR_PROJECT_REF')) return false;
    if (key.contains('YOUR_SUPABASE')) return false;
    return true;
  }
}
