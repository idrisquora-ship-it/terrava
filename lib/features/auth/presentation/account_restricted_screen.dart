import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../controllers/auth_controller.dart';

class AccountRestrictedScreen extends ConsumerWidget {
  const AccountRestrictedScreen({super.key, this.status});

  final String? status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final message = switch (status) {
      'suspended' => l10n.accountSuspendedMessage,
      'blocked' => l10n.accountBlockedMessage,
      'deleted' => l10n.accountDeletedMessage,
      _ => l10n.accountRestrictedMessage,
    };

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.gpp_bad_outlined, size: 56),
              const SizedBox(height: AppSpacing.lg),
              Text(
                l10n.accountRestrictedTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(message, textAlign: TextAlign.center),
              const SizedBox(height: AppSpacing.xl),
              TerravaButton(
                label: l10n.authSignOut,
                onPressed: () =>
                    ref.read(authControllerProvider.notifier).signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
