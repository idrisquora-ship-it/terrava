import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/constants/place_categories.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/models/place_models.dart';
import '../../../shared/services/history_repository.dart';
import '../../../shared/services/location_service.dart';
import '../../../shared/services/places_service.dart';
import '../../../shared/widgets/empty_error_state.dart';
import '../../../shared/widgets/place_cards.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/skeleton.dart';

final nearbyPlacesProvider =
    FutureProvider.autoDispose<List<PlaceSummary>>((ref) async {
  final location = await ref.watch(currentLocationProvider.future);
  if (location == null) return [];
  final places = ref.watch(placesServiceProvider);
  return places.nearbySearch(
    lat: location.lat,
    lng: location.lng,
    radiusMeters: 2000,
  );
});

final popularPlacesProvider =
    FutureProvider.autoDispose<List<PlaceSummary>>((ref) async {
  final nearby = await ref.watch(nearbyPlacesProvider.future);
  final list = List<PlaceSummary>.of(nearby);
  list.sort((a, b) {
    final ar = a.rating ?? 0;
    final br = b.rating ?? 0;
    final at = a.userRatingsTotal ?? 0;
    final bt = b.userRatingsTotal ?? 0;
    final scoreA = ar * 20 + at;
    final scoreB = br * 20 + bt;
    return scoreB.compareTo(scoreA);
  });
  return list.take(12).toList();
});

IconData _categoryIcon(String name) {
  return switch (name) {
    'restaurant' => Icons.restaurant_rounded,
    'hotel' => Icons.hotel_rounded,
    'local_hospital' => Icons.local_hospital_rounded,
    'account_balance' => Icons.account_balance_rounded,
    'local_pharmacy' => Icons.local_pharmacy_rounded,
    'school' => Icons.school_rounded,
    'local_grocery_store' => Icons.local_grocery_store_rounded,
    'storefront' => Icons.storefront_rounded,
    'local_gas_station' => Icons.local_gas_station_rounded,
    _ => Icons.place_outlined,
  };
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final locationAsync = ref.watch(currentLocationProvider);
    final nearbyAsync = ref.watch(nearbyPlacesProvider);
    final popularAsync = ref.watch(popularPlacesProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(currentLocationProvider);
          ref.invalidate(nearbyPlacesProvider);
          ref.invalidate(popularPlacesProvider);
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.md,
                    AppSpacing.lg,
                    AppSpacing.sm,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.appName, style: theme.textTheme.displayMedium),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        l10n.homeTagline,
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Material(
                        color: theme.cardTheme.color,
                        shape: theme.cardTheme.shape,
                        child: InkWell(
                          borderRadius: AppRadius.mdAll,
                          onTap: () => context.push(AppRoutes.search),
                          child: Padding(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: Text(
                                    l10n.homeSearchHint,
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      locationAsync.when(
                        data: (loc) => Text(
                          loc == null
                              ? l10n.locationPermissionNeeded
                              : l10n.locationUsingCurrent,
                          style: theme.textTheme.bodyMedium,
                        ),
                        loading: () =>
                            const SkeletonBox(width: 180, height: 14),
                        error: (_, __) => Text(
                          l10n.locationReadError,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.lg)),
            SliverToBoxAdapter(
              child: SectionHeader(
                title: l10n.homeCategoriesTitle,
                subtitle: l10n.homeCategoriesSubtitle,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 108,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.md,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: kPlaceCategories.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final category = kPlaceCategories[index];
                    return InkWell(
                      borderRadius: AppRadius.mdAll,
                      onTap: () => context.push(
                        AppRoutes.categoryPath(category.googleType),
                      ),
                      child: SizedBox(
                        width: 84,
                        child: Column(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer,
                                borderRadius: AppRadius.mdAll,
                              ),
                              child: Icon(
                                _categoryIcon(category.iconName),
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              category.localizedLabel(l10n),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
            SliverToBoxAdapter(
              child: SectionHeader(
                title: l10n.homeNearbyTitle,
                subtitle: l10n.homeNearbySubtitle,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: nearbyAsync.when(
                  data: (places) {
                    if (places.isEmpty) {
                      return EmptyState(
                        title: l10n.homeNoNearbyTitle,
                        message: l10n.homeNoNearbyMessage,
                        icon: Icons.explore_outlined,
                      );
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: places.length.clamp(0, 15),
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: AppSpacing.sm),
                      itemBuilder: (context, index) {
                        final place = places[index];
                        return PlaceCardHorizontal(
                          place: place,
                          onTap: () => context.push(
                            AppRoutes.placeDetailsPath(place.placeId),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Padding(
                    padding: EdgeInsets.all(AppSpacing.lg),
                    child: SkeletonCard(),
                  ),
                  error: (e, _) => ErrorState(
                    message: e.toString(),
                    onRetry: () => ref.invalidate(nearbyPlacesProvider),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
            SliverToBoxAdapter(
              child: SectionHeader(
                title: l10n.homeRecentlyViewedTitle,
                subtitle: l10n.homeRecentlyViewedSubtitle,
              ),
            ),
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, _) {
                  final recent = ref.watch(recentlyViewedProvider);
                  return recent.when(
                    data: (rows) {
                      if (rows.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          child: Text(l10n.homeNoRecentViews),
                        );
                      }
                      return SizedBox(
                        height: 120,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg,
                            vertical: AppSpacing.md,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: rows.length.clamp(0, 15),
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: AppSpacing.sm),
                          itemBuilder: (context, index) {
                            final row = rows[index];
                            final label = row['label'] as String? ??
                                l10n.placeFallbackName;
                            final type = row['item_type'] as String? ?? 'place';
                            return ActionChip(
                              avatar: Icon(
                                type == 'location'
                                    ? Icons.map_outlined
                                    : Icons.place_outlined,
                                size: 18,
                              ),
                              label: Text(label),
                              onPressed: () {
                                if (type == 'location' &&
                                    row['lat'] != null &&
                                    row['lng'] != null) {
                                  context.push(
                                    AppRoutes.locationDetailsPath(
                                      (row['lat'] as num).toDouble(),
                                      (row['lng'] as num).toDouble(),
                                    ),
                                  );
                                } else if (row['place_id'] != null) {
                                  context.push(
                                    AppRoutes.placeDetailsPath(
                                      row['place_id'] as String,
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      );
                    },
                    loading: () => const Padding(
                      padding: EdgeInsets.all(AppSpacing.lg),
                      child: LinearProgressIndicator(),
                    ),
                    error: (_, __) => const SizedBox.shrink(),
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
            SliverToBoxAdapter(
              child: SectionHeader(
                title: l10n.homePopularNearbyTitle,
                subtitle: l10n.homePopularNearbySubtitle,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: popularAsync.when(
                  data: (places) {
                    if (places.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: places.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: AppSpacing.sm),
                      itemBuilder: (context, index) {
                        final place = places[index];
                        return PlaceCardHorizontal(
                          place: place,
                          onTap: () => context.push(
                            AppRoutes.placeDetailsPath(place.placeId),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Padding(
                    padding: EdgeInsets.all(AppSpacing.lg),
                    child: SkeletonCard(),
                  ),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
          ],
        ),
      ),
    );
  }
}
