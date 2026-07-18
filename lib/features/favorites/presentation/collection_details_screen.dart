import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../shared/widgets/empty_error_state.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../controllers/collections_controller.dart';

class CollectionDetailsScreen extends ConsumerWidget {
  const CollectionDetailsScreen({super.key, required this.collectionId});

  final String collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final items = ref.watch(collectionItemsProvider(collectionId));
    final collections = ref.watch(collectionsProvider);
    final title = collections.maybeWhen(
      data: (rows) {
        final match = rows.where((r) => r['id'] == collectionId).toList();
        return match.isEmpty
            ? l10n.collectionFallbackName
            : (match.first['name'] as String? ?? l10n.collectionFallbackName);
      },
      orElse: () => l10n.collectionFallbackName,
    );

    return Scaffold(
      appBar: TerravaAppBar(
        title: title,
        actions: [
          IconButton(
            tooltip: l10n.collectionDeleteTooltip,
            onPressed: () async {
              await ref
                  .read(collectionsControllerProvider)
                  .deleteCollection(collectionId);
              if (context.mounted) context.pop();
            },
            icon: const Icon(Icons.delete_outline_rounded),
          ),
        ],
      ),
      body: items.when(
        data: (rows) {
          if (rows.isEmpty) {
            return EmptyState(
              title: l10n.collectionEmptyTitle,
              message: l10n.collectionEmptyMessage,
            );
          }
          return ListView.separated(
            itemCount: rows.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final row = rows[index];
              final isPlace = row['item_type'] == 'place';
              return ListTile(
                leading: Icon(
                  isPlace ? Icons.place_outlined : Icons.map_outlined,
                ),
                title: Text(
                  isPlace
                      ? (row['place_id'] as String? ?? l10n.placeFallbackName)
                      : l10n.collectionSavedArea,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => ref
                      .read(collectionsControllerProvider)
                      .removeItem(row['id'] as String, collectionId),
                ),
                onTap: isPlace && row['place_id'] != null
                    ? () => context.push(
                          AppRoutes.placeDetailsPath(row['place_id'] as String),
                        )
                    : null,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorState(message: e.toString()),
      ),
    );
  }
}
