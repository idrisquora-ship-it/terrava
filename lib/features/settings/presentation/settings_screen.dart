import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/user_preferences.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/l10n/supported_locales.dart';
import '../../../core/network/supabase_client.dart';
import '../../../core/services/fcm_service.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/theme/theme_mode_controller.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../auth/controllers/auth_controller.dart';

final appConfigProvider =
    FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
  final client = ref.watch(supabaseClientProvider);
  if (client == null) return {};
  final rows = await client.from('app_config').select();
  final map = <String, dynamic>{};
  for (final row in List<Map<String, dynamic>>.from(rows)) {
    map[row['key'] as String] = row['value'];
  }
  return map;
});

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(userPreferencesProvider);
    final themeMode = ref.watch(themeModeProvider);
    final config = ref.watch(appConfigProvider);
    final legal = config.valueOrNull?['legal'] as Map<String, dynamic>? ?? {};
    final l10n = context.l10n;

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.settingsTitle),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(l10n.settingsAppearance,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          SegmentedButton<ThemeMode>(
            segments: [
              ButtonSegment(
                  value: ThemeMode.system, label: Text(l10n.themeSystem)),
              ButtonSegment(
                  value: ThemeMode.light, label: Text(l10n.themeLight)),
              ButtonSegment(value: ThemeMode.dark, label: Text(l10n.themeDark)),
            ],
            selected: {themeMode},
            onSelectionChanged: (v) =>
                ref.read(themeModeProvider.notifier).setThemeMode(v.first),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(l10n.settingsUnits,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          SegmentedButton<String>(
            segments: [
              ButtonSegment(value: 'metric', label: Text(l10n.unitsMetric)),
              ButtonSegment(value: 'imperial', label: Text(l10n.unitsImperial)),
            ],
            selected: {prefs.units},
            onSelectionChanged: (v) =>
                ref.read(userPreferencesProvider.notifier).setUnits(v.first),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(l10n.settingsLanguage,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          DropdownButtonFormField<String>(
            key: ValueKey('locale-${prefs.locale}'),
            initialValue: prefs.locale,
            items: kSupportedLanguages.entries
                .map(
                  (entry) => DropdownMenuItem(
                    value: entry.key,
                    child: Text(entry.value),
                  ),
                )
                .toList(),
            onChanged: (v) {
              if (v != null) {
                ref.read(userPreferencesProvider.notifier).setLocale(v);
              }
            },
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(l10n.settingsCurrency,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          DropdownButtonFormField<String>(
            key: ValueKey('currency-${prefs.homeCurrency}'),
            initialValue: prefs.homeCurrency,
            items: kSupportedCurrencies.entries
                .map(
                  (entry) => DropdownMenuItem(
                    value: entry.key,
                    child: Text(entry.value),
                  ),
                )
                .toList(),
            onChanged: (v) {
              if (v != null) {
                ref.read(userPreferencesProvider.notifier).setHomeCurrency(v);
              }
            },
          ),
          const SizedBox(height: AppSpacing.xl),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.notificationsPushTitle),
            subtitle: Text(l10n.notificationsPushSubtitle),
            value: prefs.pushEnabled,
            onChanged: (v) => ref.read(fcmServiceProvider).setPushEnabled(v),
          ),
          const Divider(height: AppSpacing.xxl),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.settingsAboutTerrava),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(AppRoutes.about),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.settingsHelp),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () async {
              final url = legal['help_url'] as String?;
              if (url != null) {
                await launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
              } else {
                if (context.mounted) context.push(AppRoutes.help);
              }
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.settingsPrivacyPolicy),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () async {
              final url = legal['privacy_url'] as String?;
              if (url != null) {
                await launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
              } else {
                if (context.mounted) context.push(AppRoutes.privacy);
              }
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.settingsTermsOfService),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () async {
              final url = legal['terms_url'] as String?;
              if (url != null) {
                await launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
              } else {
                if (context.mounted) context.push(AppRoutes.terms);
              }
            },
          ),
          const SizedBox(height: AppSpacing.xl),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.authSignOut),
            leading: const Icon(Icons.logout_rounded),
            onTap: () => ref.read(authControllerProvider.notifier).signOut(),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              l10n.accountDelete,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            leading: Icon(
              Icons.delete_forever_outlined,
              color: Theme.of(context).colorScheme.error,
            ),
            onTap: () async {
              final ok = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(l10n.accountDeleteQuestion),
                  content: Text(l10n.accountDeleteWarning),
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
              await ref.read(authControllerProvider.notifier).deleteAccount();
            },
          ),
        ],
      ),
    );
  }
}
