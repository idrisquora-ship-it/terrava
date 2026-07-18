import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:terrava/l10n/app_localizations.dart';

import '../../features/auth/controllers/auth_controller.dart';
import '../../features/auth/repositories/auth_repository.dart';
import '../config/app_preferences.dart';
import '../config/user_preferences.dart';
import '../constants/app_routes.dart';
import '../network/supabase_client.dart';

const kTerravaFcmChannelId = 'terrava_default';
const kTerravaFcmChannelName = 'Terrava';
const _welcomePushKey = 'terrava_welcome_push_sent';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

/// Handles notification tap payloads before / after GoRouter is ready.
String? _pendingNotificationRoute;

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Firebase is initialized in main before this handler is registered.
  debugPrint('FCM background: ${message.messageId} ${message.data}');
}

final fcmServiceProvider = Provider<FcmService>((ref) {
  return FcmService(ref);
});

class FcmService {
  FcmService(this._ref);

  final Ref _ref;
  bool _initialized = false;
  GoRouter? _router;

  AppLocalizations get _l10n {
    final locale = _ref.read(userPreferencesProvider).locale;
    return lookupAppLocalizations(Locale(locale));
  }

  void attachRouter(GoRouter router) {
    _router = router;
    final pending = _pendingNotificationRoute;
    if (pending != null) {
      _pendingNotificationRoute = null;
      _go(pending);
    }
  }

  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    // Push on web needs a Firebase web app + VAPID key + service worker.
    // Until that is configured, keep FCM mobile-only so the site still loads.
    if (kIsWeb) return;

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    await flutterLocalNotificationsPlugin.initialize(
      settings: const InitializationSettings(android: androidInit, iOS: iosInit),
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload == null || payload.isEmpty) return;
        try {
          final data = jsonDecode(payload) as Map<String, dynamic>;
          _navigateFromData(data.map((k, v) => MapEntry(k, '$v')));
        } catch (_) {}
      },
    );

    final androidPlugin = flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    final l10n = _l10n;
    await androidPlugin?.createNotificationChannel(
      AndroidNotificationChannel(
        kTerravaFcmChannelId,
        kTerravaFcmChannelName,
        description: l10n.notificationsPushSubtitle,
        importance: Importance.high,
      ),
    );

    final messaging = FirebaseMessaging.instance;
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _navigateFromData(message.data);
    });

    final initial = await messaging.getInitialMessage();
    if (initial != null) {
      _navigateFromData(initial.data);
    }

    messaging.onTokenRefresh.listen((token) async {
      if (!_ref.read(userPreferencesProvider).pushEnabled) return;
      if (_ref.read(currentUserProvider) == null) return;
      await _saveToken(token);
    });
  }

  Future<void> syncForAuthState({required bool signedIn}) async {
    if (!signedIn) {
      await clearTokenFromProfile();
      return;
    }
    await _ref.read(userPreferencesProvider.notifier).hydrateFromProfile();
    if (!_ref.read(userPreferencesProvider).pushEnabled) {
      await clearTokenFromProfile();
      return;
    }
    await registerToken();
    await _maybeSendWelcomePush();
  }

  Future<void> setPushEnabled(bool enabled) async {
    await _ref.read(userPreferencesProvider.notifier).setPushEnabled(enabled);
    if (enabled) {
      await registerToken();
      final l10n = _l10n;
      await showLocalNotification(
        title: l10n.notificationsEnabledTitle,
        body: l10n.notificationsEnabledBody,
        data: const {'type': 'settings'},
      );
    } else {
      await unregisterToken();
    }
  }

  Future<void> registerToken() async {
    try {
      final messaging = FirebaseMessaging.instance;
      final settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        debugPrint('FCM permission denied');
        return;
      }

      final androidPlugin = flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await androidPlugin?.requestNotificationsPermission();

      final token = await messaging.getToken();
      if (token == null || token.isEmpty) return;
      await _saveToken(token);
    } catch (e) {
      debugPrint('FCM register failed: $e');
    }
  }

  Future<void> unregisterToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
    } catch (_) {}
    await clearTokenFromProfile();
  }

  Future<void> clearTokenFromProfile() async {
    try {
      await _ref.read(authRepositoryProvider).clearFcmToken();
    } catch (e) {
      debugPrint('FCM clear token failed: $e');
    }
  }

  Future<void> showLocalNotification({
    required String title,
    required String body,
    Map<String, String> data = const {},
  }) async {
    final android = AndroidNotificationDetails(
      kTerravaFcmChannelId,
      kTerravaFcmChannelName,
      channelDescription: _l10n.notificationsPushSubtitle,
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    await flutterLocalNotificationsPlugin.show(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(android: android),
      payload: jsonEncode(data),
    );
  }

  /// Notify when a place/location is saved (local — no server round-trip).
  Future<void> notifyPlaceSaved(String placeName) async {
    final prefs = _ref.read(userPreferencesProvider);
    if (!prefs.pushEnabled) return;
    final notif = await _notificationPrefs();
    if (notif['saved_updates'] == false) return;
    final l10n = _l10n;
    await showLocalNotification(
      title: l10n.notificationsPlaceSavedTitle,
      body: l10n.notificationsPlaceSavedBody(placeName),
      data: const {'type': 'saved'},
    );
  }

  Future<void> notifyLocationSaved(String label) async {
    final prefs = _ref.read(userPreferencesProvider);
    if (!prefs.pushEnabled) return;
    final notif = await _notificationPrefs();
    if (notif['saved_updates'] == false) return;
    final l10n = _l10n;
    await showLocalNotification(
      title: l10n.notificationsAreaSavedTitle,
      body: l10n.notificationsAreaSavedBody(label),
      data: const {'type': 'saved'},
    );
  }

  Future<Map<String, dynamic>> _notificationPrefs() async {
    final profile = await _ref.read(authRepositoryProvider).fetchProfile();
    final raw = profile?['notification_prefs'];
    if (raw is Map<String, dynamic>) return raw;
    return {'push_enabled': true, 'saved_updates': true, 'tips': true};
  }

  Future<void> _saveToken(String token) async {
    if (_ref.read(currentUserProvider) == null) return;
    await _ref.read(authRepositoryProvider).updateProfile(fcmToken: token);
  }

  Future<void> _onForegroundMessage(RemoteMessage message) async {
    final prefs = _ref.read(userPreferencesProvider);
    if (!prefs.pushEnabled) return;
    final l10n = _l10n;
    final title = message.notification?.title ??
        message.data['title'] ??
        l10n.appName;
    final body = message.notification?.body ??
        message.data['body'] ??
        l10n.notificationsGenericUpdate;
    await showLocalNotification(
      title: title.toString(),
      body: body.toString(),
      data: message.data.map((k, v) => MapEntry(k, '$v')),
    );
  }

  Future<void> _maybeSendWelcomePush() async {
    final prefs = _ref.read(appPrefsProvider);
    if (prefs.getBool(_welcomePushKey) == true) return;
    final notif = await _notificationPrefs();
    if (notif['tips'] == false) return;

    final client = _ref.read(supabaseClientProvider);
    if (client == null) return;
    final l10n = _l10n;

    try {
      final response = await client.functions.invoke(
        'send-push',
        body: {
          'type': 'welcome',
          'title': l10n.notificationsWelcomeTitle,
          'body': l10n.notificationsWelcomeBody,
          'data': {'type': 'home'},
        },
      );
      if (response.status == 200) {
        await prefs.setBool(_welcomePushKey, true);
        return;
      }
      debugPrint('Welcome push status ${response.status}: ${response.data}');
    } catch (e) {
      debugPrint('Welcome push skipped: $e');
    }

    await showLocalNotification(
      title: l10n.notificationsWelcomeTitle,
      body: l10n.notificationsWelcomeBody,
      data: const {'type': 'home'},
    );
    await prefs.setBool(_welcomePushKey, true);
  }

  void _navigateFromData(Map<String, dynamic> data) {
    final route = routeFromNotificationData(data);
    if (route == null) return;
    if (_router == null) {
      _pendingNotificationRoute = route;
      return;
    }
    _go(route);
  }

  void _go(String route) {
    final router = _router;
    if (router == null) return;
    try {
      if (route == AppRoutes.home ||
          route == AppRoutes.explore ||
          route == AppRoutes.saved ||
          route == AppRoutes.profile) {
        router.go(route);
      } else {
        router.push(route);
      }
    } catch (e) {
      debugPrint('FCM navigate failed: $e');
    }
  }
}

String? routeFromNotificationData(Map<String, dynamic> data) {
  final type = (data['type'] ?? data['route'] ?? '').toString();
  switch (type) {
    case 'place':
      final id = data['place_id']?.toString();
      if (id == null || id.isEmpty) return AppRoutes.home;
      return AppRoutes.placeDetailsPath(id);
    case 'location':
      final lat = double.tryParse('${data['lat']}');
      final lng = double.tryParse('${data['lng']}');
      if (lat == null || lng == null) return AppRoutes.home;
      return AppRoutes.locationDetailsPath(lat, lng);
    case 'saved':
      return AppRoutes.saved;
    case 'settings':
      return AppRoutes.settings;
    case 'search':
      return AppRoutes.search;
    case 'explore':
      return AppRoutes.explore;
    case 'home':
      return AppRoutes.home;
    case 'path':
      final path = data['path']?.toString();
      return (path != null && path.startsWith('/')) ? path : AppRoutes.home;
    default:
      final path = data['path']?.toString();
      if (path != null && path.startsWith('/')) return path;
      return null;
  }
}

/// Backward-compatible helper used by older call sites.
Future<void> registerFcmTokenIfPossible(WidgetRef ref) async {
  await ref.read(fcmServiceProvider).syncForAuthState(signedIn: true);
}
