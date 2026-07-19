import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../controllers/profile_role_providers.dart';
import '../models/user_role.dart';
import '../repositories/auth_repository.dart';
import '../widgets/auth_widgets.dart';

class ChooseRoleScreen extends ConsumerStatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  ConsumerState<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends ConsumerState<ChooseRoleScreen> {
  UserRole _role = UserRole.civilian;
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return AuthScaffold(
      title: l10n.roleChooseTitle,
      subtitle: l10n.roleChooseSubtitle,
      child: Column(
        children: [
          _RoleCard(
            selected: _role == UserRole.civilian,
            title: l10n.roleCivilian,
            body: l10n.roleCivilianHint,
            icon: Icons.person_outline_rounded,
            onTap: () => setState(() => _role = UserRole.civilian),
          ),
          const SizedBox(height: AppSpacing.md),
          _RoleCard(
            selected: _role == UserRole.businessOwner,
            title: l10n.roleBusinessOwner,
            body: l10n.roleBusinessOwnerHint,
            icon: Icons.storefront_outlined,
            onTap: () => setState(() => _role = UserRole.businessOwner),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            l10n.roleChooseFootnote,
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
            TerravaButton(
            label: l10n.commonContinue,
            isLoading: _saving,
            onPressed: () async {
              final router = GoRouter.of(context);
              final messenger = ScaffoldMessenger.of(context);
              setState(() => _saving = true);
              try {
                await ref
                    .read(authRepositoryProvider)
                    .chooseRole(_role.dbValue);
                ref.invalidate(authProfileProvider);
                if (!mounted) return;
                router.go(AppRoutes.home);
              } catch (e) {
                if (!mounted) return;
                messenger.showSnackBar(
                  SnackBar(content: Text(l10n.roleSaveFailed)),
                );
              } finally {
                if (mounted) setState(() => _saving = false);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.selected,
    required this.title,
    required this.body,
    required this.icon,
    required this.onTap,
  });

  final bool selected;
  final String title;
  final String body;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: selected
          ? theme.colorScheme.primaryContainer
          : theme.cardTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.mdAll,
        side: BorderSide(
          color: selected
              ? theme.colorScheme.primary
              : theme.dividerColor,
          width: selected ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: AppRadius.mdAll,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Icon(icon, size: 32),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(body, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
              if (selected)
                Icon(Icons.check_circle_rounded,
                    color: theme.colorScheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}
