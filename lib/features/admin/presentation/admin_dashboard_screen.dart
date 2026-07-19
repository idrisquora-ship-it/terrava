import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../../shared/widgets/terrava_text_field.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../auth/controllers/profile_role_providers.dart';
import '../repositories/admin_repository.dart';

final adminUsersProvider =
    FutureProvider.autoDispose<List<AdminUserRow>>((ref) async {
  return ref.watch(adminRepositoryProvider).listUsers();
});

final adminPendingVerificationsProvider =
    FutureProvider.autoDispose<List<AdminUserRow>>((ref) async {
  return ref.watch(adminRepositoryProvider).pendingVerifications();
});

final adminIssueReportsProvider =
    FutureProvider.autoDispose<List<IssueReportRow>>((ref) async {
  return ref.watch(adminRepositoryProvider).issueReports();
});

final adminListingReportsProvider =
    FutureProvider.autoDispose<List<ListingReportRow>>((ref) async {
  return ref.watch(adminRepositoryProvider).listingReports();
});

final adminAnnouncementsProvider =
    FutureProvider.autoDispose<List<AnnouncementRow>>((ref) async {
  return ref.watch(adminRepositoryProvider).announcements(adminAll: true);
});

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.watch(isAdminProvider);
    final l10n = context.l10n;

    if (!isAdmin) {
      return Scaffold(
        appBar: TerravaAppBar(title: l10n.adminTitle),
        body: Center(child: Text(l10n.adminAccessDenied)),
      );
    }

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TerravaAppBar(
          title: l10n.adminTitle,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: l10n.adminTabUsers),
              Tab(text: l10n.adminTabVerify),
              Tab(text: l10n.adminTabIssues),
              Tab(text: l10n.adminTabListingReports),
              Tab(text: l10n.adminTabAnnounce),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _UsersTab(),
            _VerifyTab(),
            _IssuesTab(),
            _ListingReportsTab(),
            _AnnounceTab(),
          ],
        ),
      ),
    );
  }
}

class _UsersTab extends ConsumerWidget {
  const _UsersTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(adminUsersProvider);
    final me = ref.watch(currentUserProvider)?.id;
    final l10n = context.l10n;

    return async.when(
      data: (users) => ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.lg),
        itemCount: users.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final u = users[index];
          final name = u.displayName?.trim().isNotEmpty == true
              ? u.displayName!
              : u.id.substring(0, 8);
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(name),
            subtitle: Text(
              [
                u.role,
                u.accountStatus,
                if (u.isAdmin) 'admin',
                if (u.verified) 'verified',
              ].join(' · '),
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (action) => _onUserAction(
                context,
                ref,
                u,
                action,
                me,
              ),
              itemBuilder: (_) => [
                if (!u.isAdmin)
                  PopupMenuItem(
                    value: 'make_admin',
                    child: Text(l10n.adminMakeAdmin),
                  ),
                if (u.isAdmin && u.id != me)
                  PopupMenuItem(
                    value: 'remove_admin',
                    child: Text(l10n.adminRemoveAdmin),
                  ),
                PopupMenuItem(
                  value: 'suspend',
                  child: Text(l10n.adminSuspend),
                ),
                PopupMenuItem(
                  value: 'block',
                  child: Text(l10n.adminBlock),
                ),
                PopupMenuItem(
                  value: 'activate',
                  child: Text(l10n.adminActivate),
                ),
                if (u.id != me)
                  PopupMenuItem(
                    value: 'delete',
                    child: Text(l10n.adminDeleteAccount),
                  ),
              ],
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => Center(child: Text(l10n.adminLoadFailed)),
    );
  }

  Future<void> _onUserAction(
    BuildContext context,
    WidgetRef ref,
    AdminUserRow user,
    String action,
    String? me,
  ) async {
    final l10n = context.l10n;
    final repo = ref.read(adminRepositoryProvider);
    try {
      switch (action) {
        case 'make_admin':
          await repo.setAdmin(userId: user.id, isAdmin: true);
          break;
        case 'remove_admin':
          await repo.setAdmin(userId: user.id, isAdmin: false);
          break;
        case 'suspend':
          await repo.setAccountStatus(userId: user.id, status: 'suspended');
          break;
        case 'block':
          await repo.setAccountStatus(userId: user.id, status: 'blocked');
          break;
        case 'activate':
          await repo.setAccountStatus(userId: user.id, status: 'active');
          break;
        case 'delete':
          final ok = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(l10n.adminDeleteAccount),
              content: Text(l10n.adminDeleteConfirm),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(l10n.commonCancel),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(l10n.commonDelete),
                ),
              ],
            ),
          );
          if (ok != true) return;
          await repo.softDeleteUser(user.id);
          break;
        default:
          return;
      }
      ref.invalidate(adminUsersProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminActionDone)),
        );
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminActionFailed)),
        );
      }
    }
  }
}

class _VerifyTab extends ConsumerWidget {
  const _VerifyTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(adminPendingVerificationsProvider);
    final l10n = context.l10n;

    return async.when(
      data: (users) {
        if (users.isEmpty) {
          return Center(child: Text(l10n.adminNoPendingVerify));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: users.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final u = users[index];
            final name = u.displayName ?? u.id.substring(0, 8);
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(name),
              subtitle: Text(u.role),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    tooltip: l10n.adminApprove,
                    onPressed: () async {
                      await ref.read(adminRepositoryProvider).reviewVerification(
                            userId: u.id,
                            approve: true,
                          );
                      ref.invalidate(adminPendingVerificationsProvider);
                      ref.invalidate(adminUsersProvider);
                    },
                    icon: const Icon(Icons.check_circle_outline),
                  ),
                  IconButton(
                    tooltip: l10n.adminReject,
                    onPressed: () async {
                      await ref.read(adminRepositoryProvider).reviewVerification(
                            userId: u.id,
                            approve: false,
                            note: 'Rejected by admin',
                          );
                      ref.invalidate(adminPendingVerificationsProvider);
                      ref.invalidate(adminUsersProvider);
                    },
                    icon: const Icon(Icons.cancel_outlined),
                  ),
                ],
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => Center(child: Text(l10n.adminLoadFailed)),
    );
  }
}

class _IssuesTab extends ConsumerWidget {
  const _IssuesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(adminIssueReportsProvider);
    final l10n = context.l10n;

    return async.when(
      data: (items) {
        if (items.isEmpty) {
          return Center(child: Text(l10n.adminNoIssues));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final r = items[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(r.subject),
              subtitle: Text('${r.status} · ${r.body}', maxLines: 3),
              trailing: PopupMenuButton<String>(
                onSelected: (status) async {
                  await ref.read(adminRepositoryProvider).updateIssueStatus(
                        id: r.id,
                        status: status,
                      );
                  ref.invalidate(adminIssueReportsProvider);
                  if (r.relatedUserId != null &&
                      (status == 'resolved' || status == 'in_progress')) {
                    // keep as-is; moderation of user is on Users tab
                  }
                },
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: 'in_progress',
                    child: Text(l10n.adminMarkInProgress),
                  ),
                  PopupMenuItem(
                    value: 'resolved',
                    child: Text(l10n.adminMarkResolved),
                  ),
                  PopupMenuItem(
                    value: 'dismissed',
                    child: Text(l10n.adminMarkDismissed),
                  ),
                ],
              ),
              onTap: r.relatedUserId == null
                  ? null
                  : () {
                      // Jump to users tab context via snack hint
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${l10n.adminRelatedUser}: ${r.relatedUserId}',
                          ),
                        ),
                      );
                    },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => Center(child: Text(l10n.adminLoadFailed)),
    );
  }
}

class _ListingReportsTab extends ConsumerWidget {
  const _ListingReportsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(adminListingReportsProvider);
    final l10n = context.l10n;

    return async.when(
      data: (items) {
        if (items.isEmpty) {
          return Center(child: Text(l10n.adminNoListingReports));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final r = items[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(r.reason),
              subtitle: Text('${r.status} · listing ${r.listingId}'),
              trailing: PopupMenuButton<String>(
                onSelected: (status) async {
                  await ref
                      .read(adminRepositoryProvider)
                      .updateListingReportStatus(id: r.id, status: status);
                  ref.invalidate(adminListingReportsProvider);
                },
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: 'reviewed',
                    child: Text(l10n.adminMarkReviewed),
                  ),
                  PopupMenuItem(
                    value: 'dismissed',
                    child: Text(l10n.adminMarkDismissed),
                  ),
                ],
              ),
              onTap: () => context.push(AppRoutes.listingPath(r.listingId)),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => Center(child: Text(l10n.adminLoadFailed)),
    );
  }
}

class _AnnounceTab extends ConsumerStatefulWidget {
  const _AnnounceTab();

  @override
  ConsumerState<_AnnounceTab> createState() => _AnnounceTabState();
}

class _AnnounceTabState extends ConsumerState<_AnnounceTab> {
  final _title = TextEditingController();
  final _body = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(adminAnnouncementsProvider);
    final l10n = context.l10n;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        TerravaTextField(controller: _title, label: l10n.adminAnnounceTitle),
        const SizedBox(height: AppSpacing.sm),
        TerravaTextField(
          controller: _body,
          label: l10n.adminAnnounceBody,
          maxLines: 4,
        ),
        const SizedBox(height: AppSpacing.md),
        TerravaButton(
          label: l10n.adminSendAnnounce,
          isLoading: _saving,
          onPressed: () async {
            if (_title.text.trim().isEmpty || _body.text.trim().isEmpty) {
              return;
            }
            final messenger = ScaffoldMessenger.of(context);
            setState(() => _saving = true);
            try {
              await ref.read(adminRepositoryProvider).createAnnouncement(
                    title: _title.text,
                    body: _body.text,
                  );
              _title.clear();
              _body.clear();
              ref.invalidate(adminAnnouncementsProvider);
              messenger.showSnackBar(
                SnackBar(content: Text(l10n.adminAnnounceSent)),
              );
            } catch (_) {
              messenger.showSnackBar(
                SnackBar(content: Text(l10n.adminActionFailed)),
              );
            } finally {
              if (mounted) setState(() => _saving = false);
            }
          },
        ),
        const SizedBox(height: AppSpacing.xl),
        Text(l10n.adminPastAnnouncements,
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        async.when(
          data: (items) {
            if (items.isEmpty) return Text(l10n.adminNoAnnouncements);
            return Column(
              children: [
                for (final a in items)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(a.title),
                    subtitle: Text(
                      '${a.active ? l10n.adminActive : l10n.adminInactive} · ${a.body}',
                      maxLines: 2,
                    ),
                    trailing: Switch(
                      value: a.active,
                      onChanged: (v) async {
                        await ref
                            .read(adminRepositoryProvider)
                            .setAnnouncementActive(id: a.id, active: v);
                        ref.invalidate(adminAnnouncementsProvider);
                      },
                    ),
                  ),
              ],
            );
          },
          loading: () => const LinearProgressIndicator(),
          error: (_, __) => Text(l10n.adminLoadFailed),
        ),
      ],
    );
  }
}
