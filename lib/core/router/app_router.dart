import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/controllers/auth_controller.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/auth/presentation/sign_in_screen.dart';
import '../../features/auth/presentation/sign_up_screen.dart';
import '../../features/directions/presentation/directions_screen.dart';
import '../../features/favorites/presentation/collection_details_screen.dart';
import '../../features/favorites/presentation/saved_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/map/presentation/category_map_screen.dart';
import '../../features/location_details/presentation/location_details_screen.dart';
import '../../features/map/presentation/explore_map_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/place_details/presentation/place_details_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/search/presentation/search_screen.dart';
import '../../features/settings/presentation/legal_screens.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/shell/presentation/app_shell.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../config/app_preferences.dart';
import '../constants/app_routes.dart';
import '../l10n/l10n_extensions.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouterProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier<int>(0);

  ref.listen(authSessionProvider, (_, __) => refresh.value++);
  ref.listen(onboardingCompleteProvider, (_, __) => refresh.value++);
  ref.listen(isAuthenticatedProvider, (_, __) => refresh.value++);

  ref.onDispose(refresh.dispose);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    refreshListenable: refresh,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      final loggedIn = ref.read(isAuthenticatedProvider);
      final onboarded = ref.read(onboardingCompleteProvider);
      final loc = state.matchedLocation;

      final isSplash = loc == AppRoutes.splash;
      final isOnboarding = loc == AppRoutes.onboarding;
      final isAuth = loc.startsWith('/auth');

      if (isSplash) return null;

      if (!onboarded) {
        return isOnboarding ? null : AppRoutes.onboarding;
      }

      if (!loggedIn) {
        return isAuth ? null : AppRoutes.signIn;
      }

      if (isAuth || isOnboarding) {
        return AppRoutes.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/place/:placeId',
        builder: (context, state) => PlaceDetailsScreen(
          placeId: state.pathParameters['placeId']!,
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/location/:lat/:lng',
        builder: (context, state) => LocationDetailsScreen(
          lat: double.parse(state.pathParameters['lat']!),
          lng: double.parse(state.pathParameters['lng']!),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/category/:type',
        builder: (context, state) {
          final q = state.uri.queryParameters;
          return CategoryMapScreen(
            type: state.pathParameters['type']!,
            lat: double.tryParse(q['lat'] ?? ''),
            lng: double.tryParse(q['lng'] ?? ''),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.directions,
        builder: (context, state) {
          final q = state.uri.queryParameters;
          return DirectionsScreen(
            destLat: double.parse(q['destLat']!),
            destLng: double.parse(q['destLng']!),
            destName: q['destName'],
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.about,
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.help,
        builder: (context, state) => const HelpScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.privacy,
        builder: (context, state) => LegalTextScreen(
          title: context.l10n.settingsPrivacyPolicy,
          body: context.l10n.privacyBody,
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.terms,
        builder: (context, state) => LegalTextScreen(
          title: context.l10n.settingsTermsOfService,
          body: context.l10n.termsBody,
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/collection/:id',
        builder: (context, state) => CollectionDetailsScreen(
          collectionId: state.pathParameters['id']!,
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.explore,
                builder: (context, state) => const ExploreMapScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.saved,
                builder: (context, state) => const SavedScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
