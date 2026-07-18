import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_preferences.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../auth/controllers/auth_controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1200), _goNext);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _goNext() {
    if (!mounted) return;
    final onboarded = ref.read(onboardingCompleteProvider);
    final loggedIn = ref.read(isAuthenticatedProvider);

    if (!onboarded) {
      context.go(AppRoutes.onboarding);
      return;
    }
    if (!loggedIn) {
      context.go(AppRoutes.signIn);
      return;
    }
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? const [AppColors.night, AppColors.forestDeep, AppColors.night]
                : const [AppColors.mist, AppColors.sageSoft, AppColors.sand],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.appName,
                style: theme.textTheme.displayMedium?.copyWith(
                  color: isDark ? AppColors.moon : AppColors.forestDeep,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: 0.12, end: 0, curve: Curves.easeOutCubic),
              const SizedBox(height: AppSpacing.sm),
              Text(
                l10n.splashTagline,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isDark ? AppColors.moonMuted : AppColors.inkMuted,
                ),
              ).animate().fadeIn(delay: 250.ms, duration: 500.ms),
            ],
          ),
        ),
      ),
    );
  }
}
