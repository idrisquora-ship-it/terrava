import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../../shared/widgets/terrava_text_field.dart';
import '../controllers/auth_controller.dart';
import '../models/user_role.dart';
import '../widgets/auth_widgets.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  UserRole _role = UserRole.civilian;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return AuthScaffold(
      title: l10n.authCreateAccountTitle,
      subtitle: l10n.authSignUpSubtitle,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TerravaTextField(
              controller: _name,
              label: l10n.authDisplayName,
              prefixIcon: const Icon(Icons.person_outline_rounded),
            ),
            const SizedBox(height: AppSpacing.md),
            TerravaTextField(
              controller: _email,
              label: l10n.authEmail,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.mail_outline_rounded),
              validator: (v) => (v == null || !v.contains('@'))
                  ? l10n.validationInvalidEmail
                  : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TerravaTextField(
              controller: _password,
              label: l10n.authPassword,
              obscureText: true,
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              validator: (v) => (v == null || v.length < 6)
                  ? l10n.validationPasswordMinLength
                  : null,
            ),
            const SizedBox(height: AppSpacing.lg),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(l10n.roleChooseTitle, style: theme.textTheme.titleSmall),
            ),
            const SizedBox(height: AppSpacing.sm),
            SegmentedButton<UserRole>(
              segments: [
                ButtonSegment(
                  value: UserRole.civilian,
                  label: Text(l10n.roleCivilian),
                  icon: const Icon(Icons.person_outline_rounded),
                ),
                ButtonSegment(
                  value: UserRole.businessOwner,
                  label: Text(l10n.roleBusinessOwnerShort),
                  icon: const Icon(Icons.storefront_outlined),
                ),
              ],
              selected: {_role},
              onSelectionChanged: (value) {
                setState(() => _role = value.first);
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              _role == UserRole.businessOwner
                  ? l10n.roleBusinessOwnerHint
                  : l10n.roleCivilianHint,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            if (auth.errorMessage != null) ...[
              Text(
                auth.errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
            if (auth.infoMessage != null) ...[
              Text(auth.infoMessage!),
              const SizedBox(height: AppSpacing.sm),
            ],
            TerravaButton(
              label: l10n.authSignUp,
              isLoading: auth.isLoading,
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;
                final messenger = ScaffoldMessenger.of(context);
                final router = GoRouter.of(context);
                final message = l10n.authAccountCreated;
                final ok =
                    await ref.read(authControllerProvider.notifier).signUp(
                          email: _email.text,
                          password: _password.text,
                          displayName: _name.text,
                          role: _role.dbValue,
                        );
                if (!mounted) return;
                if (ok) {
                  messenger.showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                  router.go(AppRoutes.home);
                }
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            SocialAuthButton(
              label: l10n.authContinueGoogle,
              icon: Icons.g_mobiledata_rounded,
              enabled: !auth.isLoading,
              onPressed: () =>
                  ref.read(authControllerProvider.notifier).signInWithGoogle(),
            ),
            const SizedBox(height: AppSpacing.md),
            TextButton(
              onPressed: () => context.go(AppRoutes.signIn),
              child: Text(l10n.authAlreadyHaveAccount),
            ),
          ],
        ),
      ),
    );
  }
}
