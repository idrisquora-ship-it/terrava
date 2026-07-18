import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_tokens.dart';
import '../models/place_models.dart';
import '../services/places_service.dart';
import 'skeleton.dart';

class PlaceCardHorizontal extends ConsumerWidget {
  const PlaceCardHorizontal({
    super.key,
    required this.place,
    this.onTap,
  });

  final PlaceSummary place;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final places = ref.watch(placesServiceProvider);
    final photoRef = place.photoReference;
    final imageUrl =
        photoRef == null ? null : places.photoUrl(photoRef, maxWidth: 400);

    return SizedBox(
      width: 220,
      child: Material(
        color: theme.cardTheme.color,
        shape: theme.cardTheme.shape,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: imageUrl == null
                    ? ColoredBox(
                        color: theme.dividerColor,
                        child: const Icon(Icons.place_outlined),
                      )
                    : CachedNetworkImage(
                        imageUrl: imageUrl,
                        httpHeaders: places.photoHeaders,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => const SkeletonBox(height: 120),
                        errorWidget: (_, __, ___) =>
                            const Icon(Icons.broken_image_outlined),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      [
                        if (place.rating != null)
                          '★ ${place.rating!.toStringAsFixed(1)}',
                        if (place.address != null) place.address!,
                      ].join(' · '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceListTileCard extends ConsumerWidget {
  const PlaceListTileCard({
    super.key,
    required this.place,
    this.onTap,
  });

  final PlaceSummary place;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final places = ref.watch(placesServiceProvider);
    final photoRef = place.photoReference;
    final imageUrl =
        photoRef == null ? null : places.photoUrl(photoRef, maxWidth: 200);

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xs,
      ),
      leading: ClipRRect(
        borderRadius: AppRadius.smAll,
        child: SizedBox(
          width: 56,
          height: 56,
          child: imageUrl == null
              ? ColoredBox(
                  color: theme.dividerColor,
                  child: const Icon(Icons.place_outlined),
                )
              : CachedNetworkImage(
                  imageUrl: imageUrl,
                  httpHeaders: places.photoHeaders,
                  fit: BoxFit.cover,
                ),
        ),
      ),
      title: Text(place.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        [
          if (place.rating != null) '★ ${place.rating!.toStringAsFixed(1)}',
          if (place.address != null) place.address!,
        ].join(' · '),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}
