import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../repositories/admin_repository.dart';

final publicAnnouncementsProvider =
    FutureProvider.autoDispose<List<AnnouncementRow>>((ref) async {
  return ref.watch(adminRepositoryProvider).announcements();
});

class AnnouncementsScreen extends ConsumerWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(publicAnnouncementsProvider);
    final l10n = context.l10n;

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.announcementsTitle),
      body: async.when(
        data: (items) {
          if (items.isEmpty) {
            return Center(child: Text(l10n.announcementsEmpty));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
            itemBuilder: (context, index) {
              final a = items[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(a.title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text(a.body),
                ],
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.adminLoadFailed)),
      ),
    );
  }
}
