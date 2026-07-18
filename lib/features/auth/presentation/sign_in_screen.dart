import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/env.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../../shared/widgets/terrava_text_field.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_widgets.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final l10n = context.l10n;

    return AuthScaffold(
      title: l10n.authWelcomeBack,
      subtitle: l10n.authSignInSubtitle,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.push(AppRoutes.forgotPassword),
                child: Text(l10n.authForgotPassword),
              ),
            ),
            if (auth.errorMessage != null) ...[
              Text(
                auth.errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
            TerravaButton(
              label: l10n.authSignIn,
              isLoading: auth.isLoading,
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;
                await ref.read(authControllerProvider.notifier).signIn(
                      email: _email.text,
                      password: _password.text,
                    );
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
            if (Env.enableAppleSignIn) ...[
              const SizedBox(height: AppSpacing.sm),
              SocialAuthButton(
                label: l10n.authContinueApple,
                icon: Icons.apple,
                enabled: !auth.isLoading,
                onPressed: () =>
                    ref.read(authControllerProvider.notifier).signInWithApple(),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),
            TextButton(
              onPressed: () => context.push(AppRoutes.signUp),
              child: Text(l10n.authCreateAccount),
            ),
          ],
        ),
      ),
    );
  }
}
