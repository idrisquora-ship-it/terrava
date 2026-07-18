import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/models/place_models.dart';
import '../../../shared/services/history_repository.dart';
import '../../../shared/services/offline_cache.dart';
import '../../../shared/services/places_service.dart';
import '../../../shared/widgets/empty_error_state.dart';
import '../../../shared/widgets/skeleton.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../favorites/controllers/collections_controller.dart';
import '../../favorites/controllers/favorites_controller.dart';

final placeDetailsProvider = FutureProvider.autoDispose
    .family<PlaceDetails, String>((ref, placeId) async {
  final cache = ref.watch(offlineCacheProvider);
  try {
    final live = await ref.watch(placesServiceProvider).placeDetails(placeId);
    await cache.savePlaceDetails(live);
    return live;
  } catch (_) {
    final cached = await cache.readPlaceDetails(placeId);
    if (cached != null) return cached;
    rethrow;
  }
});

class PlaceDetailsScreen extends ConsumerStatefulWidget {
  const PlaceDetailsScreen({super.key, required this.placeId});

  final String placeId;

  @override
  ConsumerState<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends ConsumerState<PlaceDetailsScreen> {
  var _tracked = false;

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(placeDetailsProvider(widget.placeId));
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return async.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(),
        body: ErrorState(
          message: e.toString(),
          onRetry: () => ref.invalidate(placeDetailsProvider(widget.placeId)),
        ),
      ),
      data: (place) {
        if (!_tracked) {
          _tracked = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(historyRepositoryProvider).trackView(
                  itemType: 'place',
                  label: place.name,
                  placeId: place.placeId,
                  lat: place.lat,
                  lng: place.lng,
                  photoUrl: place.photoReference,
                );
          });
        }

        final photo = place.photoReferences.isNotEmpty
            ? ref
                .watch(placesServiceProvider)
                .photoUrl(place.photoReferences.first, maxWidth: 1200)
            : null;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 280,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: photo == null
                      ? ColoredBox(color: theme.dividerColor)
                      : CachedNetworkImage(
                          imageUrl: photo,
                          httpHeaders:
                              ref.watch(placesServiceProvider).photoHeaders,
                          fit: BoxFit.cover,
                          placeholder: (_, __) =>
                              const SkeletonBox(height: 280),
                        ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(place.name, style: theme.textTheme.headlineLarge),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        [
                          if (place.types.isNotEmpty)
                            place.types.first.replaceAll('_', ' '),
                          if (place.rating != null)
                            '★ ${place.rating!.toStringAsFixed(1)}'
                                ' (${place.userRatingsTotal ?? 0})',
                          if (place.openNow == true) l10n.placeOpenNow,
                          if (place.openNow == false) l10n.placeClosed,
                        ].join(' · '),
                        style: theme.textTheme.bodyMedium,
                      ),
                      if (place.address != null) ...[
                        const SizedBox(height: AppSpacing.md),
                        Text(place.address!, style: theme.textTheme.bodyLarge),
                      ],
                      if (place.editorialSummary != null) ...[
                        const SizedBox(height: AppSpacing.md),
                        Text(place.editorialSummary!),
                      ],
                      const SizedBox(height: AppSpacing.lg),
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.sm,
                        children: [
                          TerravaButton(
                            label: l10n.commonDirections,
                            expand: false,
                            onPressed: place.lat == null || place.lng == null
                                ? null
                                : () => context.push(
                                      '${AppRoutes.directions}'
                                      '?destLat=${place.lat}&destLng=${place.lng}'
                                      '&destName=${Uri.encodeComponent(place.name)}',
                                    ),
                          ),
                          TerravaButton(
                            label: l10n.commonSave,
                            expand: false,
                            variant: TerravaButtonVariant.outlined,
                            onPressed: () async {
                              await ref
                                  .read(favoritesControllerProvider.notifier)
                                  .savePlace(place);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(l10n.placeSaved)),
                                );
                              }
                            },
                          ),
                          TerravaButton(
                            label: l10n.placeCollection,
                            expand: false,
                            variant: TerravaButtonVariant.outlined,
                            onPressed: () =>
                                _addToCollection(context, ref, place.placeId),
                          ),
                          TerravaButton(
                            label: l10n.commonShare,
                            expand: false,
                            variant: TerravaButtonVariant.outlined,
                            onPressed: () => Share.share(
                              '${place.name}\n${place.address ?? ''}',
                            ),
                          ),
                          if (place.phone != null)
                            TerravaButton(
                              label: l10n.placeCall,
                              expand: false,
                              variant: TerravaButtonVariant.outlined,
                              onPressed: () => launchUrl(
                                Uri(scheme: 'tel', path: place.phone),
                              ),
                            ),
                          if (place.website != null)
                            TerravaButton(
                              label: l10n.placeWebsite,
                              expand: false,
                              variant: TerravaButtonVariant.outlined,
                              onPressed: () => launchUrl(
                                Uri.parse(place.website!),
                                mode: LaunchMode.externalApplication,
                              ),
                            ),
                        ],
                      ),
                      if (place.weekdayText.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.xl),
                        Text(l10n.placeHours,
                            style: theme.textTheme.titleLarge),
                        const SizedBox(height: AppSpacing.sm),
                        ...place.weekdayText.map(
                          (line) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(line),
                          ),
                        ),
                      ],
                      if (place.reviews.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.xl),
                        Text(l10n.placeReviews,
                            style: theme.textTheme.titleLarge),
                        const SizedBox(height: AppSpacing.sm),
                        ...place.reviews.take(5).map(
                              (r) => Padding(
                                padding: const EdgeInsets.only(
                                  bottom: AppSpacing.md,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${r.authorName} · ★ ${r.rating}',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    if (r.relativeTime != null)
                                      Text(
                                        r.relativeTime!,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    Text(r.text),
                                  ],
                                ),
                              ),
                            ),
                      ],
                      const SizedBox(height: AppSpacing.xxl),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _addToCollection(
    BuildContext context,
    WidgetRef ref,
    String placeId,
  ) async {
    final collections = await ref.read(collectionsProvider.future);
    if (!context.mounted) return;
    final l10n = context.l10n;
    if (collections.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.collectionCreateFirst),
        ),
      );
      return;
    }
    final selected = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: collections
              .map(
                (c) => ListTile(
                  title:
                      Text(c['name'] as String? ?? l10n.collectionFallbackName),
                  onTap: () => Navigator.pop(context, c['id'] as String),
                ),
              )
              .toList(),
        );
      },
    );
    if (selected == null) return;
    await ref.read(collectionsControllerProvider).addPlace(
          collectionId: selected,
          placeId: placeId,
        );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.collectionAdded)),
      );
    }
  }
}
