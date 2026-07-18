import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/empty_error_state.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../controllers/collections_controller.dart';
import '../controllers/favorites_controller.dart';

class SavedScreen extends ConsumerWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(savedPlacesProvider);
    final locations = ref.watch(savedLocationsProvider);
    final collections = ref.watch(collectionsProvider);
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(savedPlacesProvider);
            ref.invalidate(savedLocationsProvider);
            ref.invalidate(collectionsProvider);
          },
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Text(l10n.savedTitle, style: theme.textTheme.headlineLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(
                l10n.savedSubtitle,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.xl),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.savedCollectionsTitle,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => _createCollection(context, ref),
                    icon: const Icon(Icons.add_rounded),
                    label: Text(l10n.savedNewCollection),
                  ),
                ],
              ),
              collections.when(
                data: (rows) {
                  if (rows.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                      child: Text(l10n.savedNoCollections),
                    );
                  }
                  return Column(
                    children: rows
                        .map(
                          (row) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.folder_outlined),
                            title: Text(
                              row['name'] as String? ??
                                  l10n.collectionFallbackName,
                            ),
                            subtitle: Text(row['description'] as String? ?? ''),
                            trailing: const Icon(Icons.chevron_right_rounded),
                            onTap: () => context.push(
                              AppRoutes.collectionPath(row['id'] as String),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text(e.toString()),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(l10n.savedNeighborhoodsTitle,
                  style: theme.textTheme.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              locations.when(
                data: (rows) {
                  if (rows.isEmpty) {
                    return Text(l10n.savedNoAreas);
                  }
                  return Column(
                    children: rows
                        .map(
                          (row) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.map_outlined),
                            title: Text(row['label'] as String? ??
                                l10n.areaFallbackName),
                            subtitle: Text(
                              row['formatted_address'] as String? ?? '',
                            ),
                            onTap: () {
                              final lat = (row['lat'] as num).toDouble();
                              final lng = (row['lng'] as num).toDouble();
                              context.push(
                                AppRoutes.locationDetailsPath(lat, lng),
                              );
                            },
                          ),
                        )
                        .toList(),
                  );
                },
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text(e.toString()),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(l10n.savedPlacesTitle, style: theme.textTheme.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              places.when(
                data: (rows) {
                  if (rows.isEmpty) {
                    return EmptyState(
                      title: l10n.savedNoPlacesTitle,
                      message: l10n.savedNoPlacesMessage,
                      icon: Icons.bookmark_border_rounded,
                    );
                  }
                  return Column(
                    children: rows
                        .map(
                          (row) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.place_outlined),
                            title: Text(row['name'] as String? ??
                                l10n.placeFallbackName),
                            subtitle: Text(row['address'] as String? ?? ''),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline_rounded),
                              onPressed: () => ref
                                  .read(favoritesControllerProvider.notifier)
                                  .removePlace(row['place_id'] as String),
                            ),
                            onTap: () => context.push(
                              AppRoutes.placeDetailsPath(
                                row['place_id'] as String,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text(e.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createCollection(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final controller = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.collectionNewTitle),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(hintText: l10n.collectionNameHint),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.commonCancel),
          ),
          TerravaButton(
            label: l10n.commonCreate,
            expand: false,
            onPressed: () => Navigator.pop(context, controller.text.trim()),
          ),
        ],
      ),
    );
    if (name == null || name.isEmpty) return;
    await ref.read(collectionsControllerProvider).createCollection(name);
  }
}
