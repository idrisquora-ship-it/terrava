import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import 'settings_screen.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(appConfigProvider);
    final legal = config.valueOrNull?['legal'] as Map<String, dynamic>? ?? {};
    final about =
        legal['about'] as String? ?? context.l10n.aboutDefaultDescription;

    return Scaffold(
      appBar: TerravaAppBar(title: context.l10n.aboutTitle),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.appName,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(about, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: AppSpacing.xl),
            Text(
              context.l10n.aboutVersion('0.1.0'),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TerravaAppBar(title: context.l10n.helpTitle),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(context.l10n.helpHowItWorksTitle),
          const SizedBox(height: AppSpacing.sm),
          Text(context.l10n.helpHowItWorksBody),
          const SizedBox(height: AppSpacing.lg),
          Text(context.l10n.helpScoresTitle),
          const SizedBox(height: AppSpacing.sm),
          Text(context.l10n.helpScoresBody),
        ],
      ),
    );
  }
}

class LegalTextScreen extends StatelessWidget {
  const LegalTextScreen({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TerravaAppBar(title: title),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Text(body, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
