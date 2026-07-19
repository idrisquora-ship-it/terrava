import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/admin_dashboard_screen.dart';
import '../../features/admin/presentation/announcements_screen.dart';
import '../../features/admin/presentation/report_issue_screen.dart';
import '../../features/auth/controllers/auth_controller.dart';
import '../../features/auth/controllers/profile_role_providers.dart';
import '../../features/auth/presentation/account_restricted_screen.dart';
import '../../features/auth/presentation/choose_role_screen.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/auth/presentation/sign_in_screen.dart';
import '../../features/auth/presentation/sign_up_screen.dart';
import '../../features/chat/presentation/chat_thread_screen.dart';
import '../../features/chat/presentation/inbox_screen.dart';
import '../../features/directions/presentation/directions_screen.dart';
import '../../features/favorites/presentation/collection_details_screen.dart';
import '../../features/favorites/presentation/saved_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/map/presentation/category_map_screen.dart';
import '../../features/location_details/presentation/location_details_screen.dart';
import '../../features/listings/presentation/create_listing_screen.dart';
import '../../features/listings/presentation/listing_alerts_screen.dart';
import '../../features/listings/presentation/listing_details_screen.dart';
import '../../features/listings/presentation/my_listings_screen.dart';
import '../../features/listings/presentation/owner_dashboard_screen.dart';
import '../../features/listings/presentation/rentals_browse_screen.dart';
import '../../features/listings/presentation/saved_listings_screen.dart';
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
  ref.listen(authProfileProvider, (_, __) => refresh.value++);

  ref.onDispose(refresh.dispose);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    refreshListenable: refresh,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      final loggedIn = ref.read(isAuthenticatedProvider);
      final onboarded = ref.read(onboardingCompleteProvider);
      final needsRole = ref.read(needsRolePickerProvider);
      final restriction = ref.read(accountRestrictionProvider);
      final loc = state.matchedLocation;

      final isSplash = loc == AppRoutes.splash;
      final isOnboarding = loc == AppRoutes.onboarding;
      final isAuth = loc.startsWith('/auth');
      final isChooseRole = loc == AppRoutes.chooseRole;
      final isRestricted = loc == AppRoutes.accountRestricted;

      if (isSplash) return null;

      if (!onboarded) {
        return isOnboarding ? null : AppRoutes.onboarding;
      }

      if (!loggedIn) {
        return isAuth && !isChooseRole && !isRestricted
            ? null
            : AppRoutes.signIn;
      }

      if (restriction != null) {
        return isRestricted ? null : AppRoutes.accountRestricted;
      }

      if (needsRole) {
        return isChooseRole ? null : AppRoutes.chooseRole;
      }

      if (isAuth || isOnboarding || isChooseRole || isRestricted) {
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
        path: AppRoutes.accountRestricted,
        builder: (context, state) {
          final status = ref.read(accountRestrictionProvider);
          return AccountRestrictedScreen(status: status);
        },
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
        path: AppRoutes.chooseRole,
        builder: (context, state) => const ChooseRoleScreen(),
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
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.listingsNew,
        builder: (context, state) => const CreateListingScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.listingsMine,
        builder: (context, state) => const MyListingsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.listingsDashboard,
        builder: (context, state) => const OwnerDashboardScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.listingsAlerts,
        builder: (context, state) => const ListingAlertsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.listingsSaved,
        builder: (context, state) => const SavedListingsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.rentalsBrowse,
        builder: (context, state) => const RentalsBrowseScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.admin,
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.reportIssue,
        builder: (context, state) {
          final extras = state.extra as Map<String, String?>?;
          return ReportIssueScreen(
            relatedUserId: extras?['relatedUserId'],
            relatedListingId: extras?['relatedListingId'],
            initialSubject: extras?['subject'],
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.announcements,
        builder: (context, state) => const AnnouncementsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/listings/:id',
        builder: (context, state) => ListingDetailsScreen(
          listingId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.inbox,
        builder: (context, state) => const InboxScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/chat/:conversationId',
        builder: (context, state) => ChatThreadScreen(
          conversationId: state.pathParameters['conversationId']!,
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
