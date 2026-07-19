import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/config/app_preferences.dart';
import 'core/config/env.dart';
import 'core/network/supabase_client.dart';
import 'core/services/fcm_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await firebaseMessagingBackgroundHandler(message);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  final prefs = await SharedPreferences.getInstance();
  final supabaseReady = await initializeSupabaseIfConfigured();

  var firebaseReady = false;
  if (!kIsWeb) {
    try {
      await Firebase.initializeApp();
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
      firebaseReady = true;
    } catch (e) {
      debugPrint('Firebase init skipped/failed: $e');
    }
  } else {
    // Web push needs flutterfire configure + a service worker. Auth, Maps,
    // Places, and Supabase still run without Firebase on web.
    debugPrint('Firebase skipped on web (configure later for web push).');
  }

  Future<void> startApp() async {
    runApp(
      ProviderScope(
        overrides: [
          appPrefsProvider.overrideWithValue(prefs),
          supabaseInitializedProvider.overrideWithValue(supabaseReady),
        ],
        child: TerravaApp(firebaseReady: firebaseReady),
      ),
    );
  }

  final dsn = Env.sentryDsn;
  if (dsn.isNotEmpty) {
    await SentryFlutter.init(
      (options) {
        options.dsn = dsn;
        options.environment = Env.appEnv;
        options.tracesSampleRate = 0.2;
      },
      appRunner: startApp,
    );
  } else {
    await startApp();
  }
}
