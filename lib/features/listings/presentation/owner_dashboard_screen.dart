import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/skeleton.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../repositories/listings_repository.dart';

final ownerDashboardProvider =
    FutureProvider.autoDispose<OwnerDashboardStats>((ref) async {
  return ref.watch(listingsRepositoryProvider).ownerStats();
});

class OwnerDashboardScreen extends ConsumerWidget {
  const OwnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(ownerDashboardProvider);
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.listingsDashboardTitle),
      body: async.when(
        data: (stats) => ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text(
              l10n.listingsVerifiedComingSoon,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.lg),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: [
                _StatCard(
                  label: l10n.listingsStatTotal,
                  value: '${stats.listingCount}',
                ),
                _StatCard(
                  label: l10n.listingsStatActive,
                  value: '${stats.activeCount}',
                ),
                _StatCard(
                  label: l10n.listingsStatViews,
                  value: '${stats.totalViews}',
                ),
                _StatCard(
                  label: l10n.listingsStatMessages,
                  value: '${stats.messageThreads}',
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            TerravaButton(
              label: l10n.listingsMineTitle,
              onPressed: () => context.push(AppRoutes.listingsMine),
            ),
            const SizedBox(height: AppSpacing.sm),
            TerravaButton(
              label: l10n.listingsCreateTitle,
              variant: TerravaButtonVariant.outlined,
              onPressed: () => context.push(AppRoutes.listingsNew),
            ),
            const SizedBox(height: AppSpacing.sm),
            TerravaButton(
              label: l10n.chatInboxTitle,
              variant: TerravaButtonVariant.outlined,
              onPressed: () => context.push(AppRoutes.inbox),
            ),
          ],
        ),
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: SkeletonCard(),
        ),
        error: (_, __) => Center(child: Text(l10n.listingsLoadFailed)),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: theme.textTheme.headlineMedium),
              const SizedBox(height: 4),
              Text(label, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
