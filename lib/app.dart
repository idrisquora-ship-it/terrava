import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:terrava/l10n/app_localizations.dart';

import 'core/config/user_preferences.dart';
import 'core/l10n/supported_locales.dart';
import 'core/router/app_router.dart';
import 'core/services/fcm_service.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_mode_controller.dart';
import 'features/auth/controllers/auth_controller.dart';

class TerravaApp extends ConsumerStatefulWidget {
  const TerravaApp({super.key, this.firebaseReady = false});

  final bool firebaseReady;

  @override
  ConsumerState<TerravaApp> createState() => _TerravaAppState();
}

class _TerravaAppState extends ConsumerState<TerravaApp> {
  var _fcmBootstrapped = false;

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    final themeMode = ref.watch(themeModeProvider);
    final prefs = ref.watch(userPreferencesProvider);
    final locale = localeFromCode(prefs.locale);

    if (widget.firebaseReady) {
      ref.listen<bool>(isAuthenticatedProvider, (previous, next) {
        ref.read(fcmServiceProvider).syncForAuthState(signedIn: next);
      });

      if (!_fcmBootstrapped) {
        _fcmBootstrapped = true;
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          final fcm = ref.read(fcmServiceProvider);
          await fcm.initialize();
          fcm.attachRouter(router);
          if (ref.read(isAuthenticatedProvider)) {
            await fcm.syncForAuthState(signedIn: true);
          }
        });
      } else {
        ref.read(fcmServiceProvider).attachRouter(router);
      }
    }

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: supportedFlutterLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
