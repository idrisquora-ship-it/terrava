import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/empty_error_state.dart';
import '../../../shared/widgets/skeleton.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../models/listing.dart';
import '../repositories/listings_repository.dart';

final savedListingsProvider =
    FutureProvider.autoDispose<List<Listing>>((ref) async {
  return ref.watch(listingsRepositoryProvider).savedListings();
});

class SavedListingsScreen extends ConsumerWidget {
  const SavedListingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(savedListingsProvider);
    final l10n = context.l10n;

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.listingsSavedTitle),
      body: async.when(
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              title: l10n.listingsSavedEmptyTitle,
              message: l10n.listingsSavedEmptyMessage,
              icon: Icons.bookmark_border_rounded,
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) {
              final listing = items[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: AppRadius.mdAll,
                  child: listing.coverPhoto == null
                      ? Container(
                          width: 56,
                          height: 56,
                          color: Theme.of(context).colorScheme.primaryContainer,
                          child: const Icon(Icons.home_work_outlined),
                        )
                      : CachedNetworkImage(
                          imageUrl: listing.coverPhoto!,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                        ),
                ),
                title: Text(listing.title),
                subtitle: Text(
                  [
                    if (listing.areaLabel != null) listing.areaLabel!,
                    if (listing.city != null) listing.city!,
                  ].join(' · '),
                ),
                onTap: () => context.push(AppRoutes.listingPath(listing.id)),
              );
            },
          );
        },
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: SkeletonCard(),
        ),
        error: (_, __) => ErrorState(
          message: l10n.listingsLoadFailed,
          onRetry: () => ref.invalidate(savedListingsProvider),
        ),
      ),
    );
  }
}
