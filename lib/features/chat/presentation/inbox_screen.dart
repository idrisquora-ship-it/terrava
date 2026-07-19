import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/empty_error_state.dart';
import '../../../shared/widgets/skeleton.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../models/chat_models.dart';
import '../repositories/chat_repository.dart';

final inboxProvider =
    FutureProvider.autoDispose<List<ConversationSummary>>((ref) async {
  return ref.watch(chatRepositoryProvider).inbox();
});

class InboxScreen extends ConsumerWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(inboxProvider);
    final l10n = context.l10n;

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.chatInboxTitle),
      body: async.when(
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              title: l10n.chatInboxEmptyTitle,
              message: l10n.chatInboxEmptyMessage,
              icon: Icons.chat_bubble_outline_rounded,
            );
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(inboxProvider),
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final c = items[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    child: Icon(Icons.chat_rounded),
                  ),
                  title: Text(c.listingTitle),
                  subtitle: Text(
                    c.lastMessage ??
                        (c.otherUserName ?? l10n.chatNoMessagesYet),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => context.push(AppRoutes.chatPath(c.id)),
                );
              },
            ),
          );
        },
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: SkeletonCard(),
        ),
        error: (_, __) => ErrorState(
          message: l10n.chatLoadFailed,
          onRetry: () => ref.invalidate(inboxProvider),
        ),
      ),
    );
  }
}
