import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_tokens.dart';

abstract final class AppTheme {
  static ThemeData light() {
    final baseText = GoogleFonts.plusJakartaSansTextTheme();
    final display = GoogleFonts.fraunces();

    const colorScheme = ColorScheme.light(
      primary: AppColors.forest,
      onPrimary: Colors.white,
      primaryContainer: AppColors.sageSoft,
      onPrimaryContainer: AppColors.forestDeep,
      secondary: AppColors.sage,
      onSecondary: AppColors.forestDeep,
      surface: AppColors.mist,
      onSurface: AppColors.ink,
      onSurfaceVariant: AppColors.inkMuted,
      outline: AppColors.sand,
      error: AppColors.danger,
    );

    return _build(
      brightness: Brightness.light,
      colorScheme: colorScheme,
      baseText: baseText,
      display: display,
      scaffold: AppColors.mist,
      card: Colors.white,
      divider: AppColors.sand,
      systemOverlay: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  static ThemeData dark() {
    final baseText = GoogleFonts.plusJakartaSansTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    );
    final display = GoogleFonts.fraunces(
      color: AppColors.moon,
    );

    const colorScheme = ColorScheme.dark(
      primary: AppColors.sageSoft,
      onPrimary: AppColors.forestDeep,
      primaryContainer: AppColors.forest,
      onPrimaryContainer: AppColors.sageSoft,
      secondary: AppColors.sage,
      onSecondary: AppColors.night,
      surface: AppColors.night,
      onSurface: AppColors.moon,
      onSurfaceVariant: AppColors.moonMuted,
      outline: AppColors.nightBorder,
      error: AppColors.danger,
    );

    return _build(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      baseText: baseText,
      display: display,
      scaffold: AppColors.night,
      card: AppColors.nightElevated,
      divider: AppColors.nightBorder,
      systemOverlay: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  static ThemeData _build({
    required Brightness brightness,
    required ColorScheme colorScheme,
    required TextTheme baseText,
    required TextStyle display,
    required Color scaffold,
    required Color card,
    required Color divider,
    required SystemUiOverlayStyle systemOverlay,
  }) {
    final textTheme = baseText.copyWith(
      displayLarge: display.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        height: 1.1,
        letterSpacing: -0.5,
        color: colorScheme.onSurface,
      ),
      displayMedium: display.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 1.15,
        color: colorScheme.onSurface,
      ),
      headlineLarge: display.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      headlineMedium: baseText.headlineMedium?.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
      ),
      titleLarge: baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
      ),
      titleMedium: baseText.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      bodyLarge: baseText.bodyLarge?.copyWith(
        fontSize: 16,
        height: 1.5,
        color: colorScheme.onSurface,
      ),
      bodyMedium: baseText.bodyMedium?.copyWith(
        fontSize: 14,
        height: 1.45,
        color: colorScheme.onSurfaceVariant,
      ),
      labelLarge: baseText.labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffold,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: scaffold,
        foregroundColor: colorScheme.onSurface,
        systemOverlayStyle: systemOverlay,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.mdAll,
          side: BorderSide(color: divider),
        ),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: DividerThemeData(color: divider, thickness: 1),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: card,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
          side: BorderSide(color: divider),
          textStyle: textTheme.labelLarge,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: card,
        indicatorColor: colorScheme.primaryContainer.withValues(alpha: 0.55),
        labelTextStyle: WidgetStatePropertyAll(
          textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        height: 72,
      ),
    );
  }
}
