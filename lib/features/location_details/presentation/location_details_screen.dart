import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/config/user_preferences.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/constants/place_categories.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/models/place_models.dart';
import '../../../shared/services/history_repository.dart';
import '../../../shared/services/places_service.dart';
import '../../../shared/widgets/place_cards.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/skeleton.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../../shared/widgets/terrava_map.dart';
import '../../favorites/controllers/favorites_controller.dart';
import '../../scoring/services/insight_services.dart';

typedef LocationPoint = ({double lat, double lng});

final locationLabelProvider = FutureProvider.autoDispose
    .family<String, LocationPoint>((ref, point) async {
  final reverse = await ref.watch(placesServiceProvider).reverseGeocode(
        lat: point.lat,
        lng: point.lng,
      );
  return reverse?.formattedAddress ??
      '${point.lat.toStringAsFixed(4)}, ${point.lng.toStringAsFixed(4)}';
});

final locationCategoryProvider = FutureProvider.autoDispose
    .family<List<PlaceSummary>, ({LocationPoint point, String type})>(
        (ref, args) async {
  return ref.watch(placesServiceProvider).nearbySearch(
        lat: args.point.lat,
        lng: args.point.lng,
        type: args.type,
        radiusMeters: 1500,
      );
});

class LocationDetailsScreen extends ConsumerStatefulWidget {
  const LocationDetailsScreen({
    super.key,
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  @override
  ConsumerState<LocationDetailsScreen> createState() =>
      _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends ConsumerState<LocationDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final label = await ref.read(
        locationLabelProvider((lat: widget.lat, lng: widget.lng)).future,
      );
      await ref.read(historyRepositoryProvider).trackView(
            itemType: 'location',
            label: label,
            lat: widget.lat,
            lng: widget.lng,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final point = (lat: widget.lat, lng: widget.lng);
    final labelAsync = ref.watch(locationLabelProvider(point));
    final label = labelAsync.valueOrNull;
    final insightAsync = ref.watch(
      neighborhoodInsightProvider(
        (
          lat: widget.lat,
          lng: widget.lng,
          label: label,
          locale: ref.watch(userPreferencesProvider).locale,
        ),
      ),
    );
    final prefs = ref.watch(userPreferencesProvider);
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: TerravaMap(
                center: LatLng(widget.lat, widget.lng),
                zoom: 14,
                interactive: false,
                markers: [
                  terravaPlaceMarker(
                    point: LatLng(widget.lat, widget.lng),
                    label: 'Center',
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.locationNeighborhood,
                      style: theme.textTheme.labelLarge),
                  const SizedBox(height: AppSpacing.xs),
                  labelAsync.when(
                    data: (value) =>
                        Text(value, style: theme.textTheme.headlineLarge),
                    loading: () => const SkeletonBox(width: 240, height: 28),
                    error: (_, __) => Text(
                      '${widget.lat.toStringAsFixed(4)}, ${widget.lng.toStringAsFixed(4)}',
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  insightAsync.when(
                    data: (insight) {
                      final score = insight.score;
                      final weather = insight.weather;
                      final fx = insight.fx;
                      final currency = prefs.homeCurrency;
                      final rate = fx?.rates[currency];
                      final sortedGroups = [...score.groups]
                        ..sort((a, b) => b.score.compareTo(a.score));
                      int groupCount(String id) =>
                          score.groups.firstWhere((g) => g.id == id).count;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.amenityScore(score.overall.round()),
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            localizedScoreSummary(
                              l10n: l10n,
                              areaName: label ?? l10n.areaFallbackName,
                              overall: score.overall.round(),
                              strongestId: sortedGroups.first.id,
                              weakestId: sortedGroups.last.id,
                              radiusKm: score.radiusMeters / 1000,
                              essentialsCount: groupCount('essentials'),
                              healthCount: groupCount('health'),
                              foodCount: groupCount('food'),
                              transportCount: groupCount('transport'),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Wrap(
                            spacing: AppSpacing.sm,
                            runSpacing: AppSpacing.sm,
                            children: score.groups
                                .map(
                                  (g) => Chip(
                                    label: Text(
                                      '${g.id.localizedScoreGroup(l10n)} ${g.score.round()}',
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          if (weather != null) ...[
                            const SizedBox(height: AppSpacing.md),
                            Row(
                              children: [
                                if (weather.iconUrl.isNotEmpty)
                                  CachedNetworkImage(
                                    imageUrl: weather.iconUrl,
                                    width: 40,
                                    height: 40,
                                  ),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: Text(
                                    l10n.weatherSummary(
                                      weather.tempC.round(),
                                      weather.condition,
                                      weather.feelsLikeC.round(),
                                      weather.humidity,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          if (rate != null) ...[
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              localizedFxLine(
                                l10n,
                                fx!.base,
                                rate,
                                currency,
                              ),
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ],
                      );
                    },
                    loading: () => const Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                      child: LinearProgressIndicator(),
                    ),
                    error: (e, _) => Text(
                      l10n.locationInsightsUnavailable(e.toString()),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Wrap(
                    spacing: AppSpacing.sm,
                    children: [
                      TerravaButton(
                        label: l10n.commonDirections,
                        expand: false,
                        onPressed: () => context.push(
                          '${AppRoutes.directions}?destLat=${widget.lat}&destLng=${widget.lng}',
                        ),
                      ),
                      TerravaButton(
                        label: l10n.locationSaveArea,
                        expand: false,
                        variant: TerravaButtonVariant.outlined,
                        onPressed: () async {
                          final value = await ref.read(
                            locationLabelProvider(point).future,
                          );
                          await ref
                              .read(favoritesControllerProvider.notifier)
                              .saveLocation(
                                label: value,
                                lat: widget.lat,
                                lng: widget.lng,
                              );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.locationAreaSaved)),
                            );
                          }
                        },
                      ),
                      TerravaButton(
                        label: l10n.commonShare,
                        expand: false,
                        variant: TerravaButtonVariant.outlined,
                        onPressed: () async {
                          final value = await ref.read(
                            locationLabelProvider(point).future,
                          );
                          await Share.share(
                            '$value\n${widget.lat}, ${widget.lng}',
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          for (final category in kPlaceCategories) ...[
            SliverToBoxAdapter(
              child: SectionHeader(
                title: category.localizedLabel(l10n),
                actionLabel: l10n.commonSeeAll,
                onAction: () => context.push(
                  AppRoutes.categoryPathAt(
                    category.googleType,
                    widget.lat,
                    widget.lng,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _CategoryRow(
                point: point,
                type: category.googleType,
              ),
            ),
          ],
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
        ],
      ),
    );
  }
}

class _CategoryRow extends ConsumerWidget {
  const _CategoryRow({required this.point, required this.type});

  final LocationPoint point;
  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(
      locationCategoryProvider((point: point, type: type)),
    );

    return SizedBox(
      height: 220,
      child: async.when(
        data: (places) {
          if (places.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(context.l10n.locationNoRadiusResults),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: places.length.clamp(0, 10),
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
            itemBuilder: (context, index) {
              final place = places[index];
              return PlaceCardHorizontal(
                place: place,
                onTap: () =>
                    context.push(AppRoutes.placeDetailsPath(place.placeId)),
              );
            },
          );
        },
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: SkeletonCard(),
        ),
        error: (e, _) => Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Text(e.toString()),
        ),
      ),
    );
  }
}
