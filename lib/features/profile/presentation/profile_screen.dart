import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/user_preferences.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/theme/theme_mode_controller.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../auth/controllers/profile_role_providers.dart';
import '../../auth/models/user_role.dart';
import '../../auth/repositories/auth_repository.dart';
import '../../admin/repositories/admin_repository.dart';

final profileProvider = FutureProvider.autoDispose((ref) async {
  await ref.read(userPreferencesProvider.notifier).hydrateFromProfile();
  return ref.watch(authRepositoryProvider).fetchProfile();
});

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final profile = ref.watch(profileProvider);
    final role = ref.watch(userRoleProvider);
    final isAdmin = ref.watch(isAdminProvider);
    final themeMode = ref.watch(themeModeProvider);
    final theme = Theme.of(context);
    final l10n = context.l10n;

    final displayName = profile.valueOrNull?['display_name'] as String? ??
        user?.userMetadata?['full_name'] as String? ??
        user?.email?.split('@').first ??
        l10n.profileFallbackName;
    final avatarUrl = profile.valueOrNull?['avatar_url'] as String?;
    final verified = profile.valueOrNull?['verified'] == true;
    final verificationStatus =
        profile.valueOrNull?['verification_status'] as String? ?? 'none';

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text(l10n.profileTitle, style: theme.textTheme.headlineLarge),
            const SizedBox(height: AppSpacing.lg),
            Center(
              child: GestureDetector(
                onTap: () => _pickAvatar(context, ref),
                child: CircleAvatar(
                  radius: 44,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  backgroundImage: avatarUrl == null || avatarUrl.isEmpty
                      ? null
                      : CachedNetworkImageProvider(avatarUrl),
                  child: avatarUrl == null || avatarUrl.isEmpty
                      ? Text(
                          displayName.isNotEmpty
                              ? displayName[0].toUpperCase()
                              : 'T',
                          style: theme.textTheme.headlineMedium,
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Center(
              child: TextButton(
                onPressed: () => _pickAvatar(context, ref),
                child: Text(l10n.profileChangePhoto),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(displayName, style: theme.textTheme.titleLarge),
            Text(user?.email ?? '', style: theme.textTheme.bodyMedium),
            Text(
              [
                role == UserRole.businessOwner
                    ? l10n.roleBusinessOwner
                    : l10n.roleCivilian,
                if (isAdmin) l10n.adminBadge,
                if (verified) l10n.listingsVerifiedBadge,
              ].join(' · '),
              style: theme.textTheme.labelLarge,
            ),
            if (!verified) ...[
              const SizedBox(height: AppSpacing.sm),
              if (verificationStatus == 'pending')
                Text(l10n.verificationPending)
              else if (verificationStatus == 'rejected')
                Text(l10n.verificationRejected)
              else
                TextButton(
                  onPressed: () async {
                    try {
                      await ref
                          .read(adminRepositoryProvider)
                          .requestVerification();
                      ref.invalidate(profileProvider);
                      ref.invalidate(authProfileProvider);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.verificationRequested)),
                        );
                      }
                    } catch (_) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.verificationFailed)),
                        );
                      }
                    }
                  },
                  child: Text(l10n.verificationRequest),
                ),
            ],
            const SizedBox(height: AppSpacing.xl),
            if (isAdmin)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.admin_panel_settings_outlined),
                title: Text(l10n.adminTitle),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push(AppRoutes.admin),
              ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.campaign_outlined),
              title: Text(l10n.announcementsTitle),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(AppRoutes.announcements),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.support_agent_outlined),
              title: Text(l10n.reportIssueTitle),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(AppRoutes.reportIssue),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.chat_bubble_outline_rounded),
              title: Text(l10n.chatInboxTitle),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(AppRoutes.inbox),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.bookmark_added_outlined),
              title: Text(l10n.listingsSavedTitle),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(AppRoutes.listingsSaved),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.notifications_active_outlined),
              title: Text(l10n.listingsAlertsTitle),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(AppRoutes.listingsAlerts),
            ),
            if (role.canList) ...[
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.insights_outlined),
                title: Text(l10n.listingsDashboardTitle),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push(AppRoutes.listingsDashboard),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.storefront_outlined),
                title: Text(l10n.listingsMineTitle),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push(AppRoutes.listingsMine),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.add_business_outlined),
                title: Text(l10n.listingsCreateTitle),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push(AppRoutes.listingsNew),
              ),
            ],
            const SizedBox(height: AppSpacing.xl),
            Text(l10n.settingsAppearance, style: theme.textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            SegmentedButton<ThemeMode>(
              segments: [
                ButtonSegment(
                  value: ThemeMode.system,
                  label: Text(l10n.themeSystem),
                  icon: const Icon(Icons.brightness_auto_rounded),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  label: Text(l10n.themeLight),
                  icon: const Icon(Icons.light_mode_outlined),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  label: Text(l10n.themeDark),
                  icon: const Icon(Icons.dark_mode_outlined),
                ),
              ],
              selected: {themeMode},
              onSelectionChanged: (value) {
                ref.read(themeModeProvider.notifier).setThemeMode(value.first);
              },
            ),
            const SizedBox(height: AppSpacing.xl),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.settings_outlined),
              title: Text(l10n.settingsTitle),
              subtitle: Text(l10n.profileSettingsSubtitle),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(AppRoutes.settings),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.bookmark_outline_rounded),
              title: Text(l10n.navSaved),
              onTap: () => context.go(AppRoutes.saved),
            ),
            const SizedBox(height: AppSpacing.xl),
            TerravaButton(
              label: l10n.authSignOut,
              variant: TerravaButtonVariant.outlined,
              onPressed: () async {
                await ref.read(authControllerProvider.notifier).signOut();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickAvatar(BuildContext context, WidgetRef ref) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      imageQuality: 85,
    );
    if (file == null) return;
    final bytes = await file.readAsBytes();
    final name = file.name.toLowerCase();
    final ext = name.endsWith('.png')
        ? 'png'
        : name.endsWith('.webp')
            ? 'webp'
            : 'jpg';
    try {
      await ref.read(authRepositoryProvider).uploadAvatar(bytes, ext: ext);
      ref.invalidate(profileProvider);
      ref.invalidate(authProfileProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.profilePhotoUpdated)),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }
}
