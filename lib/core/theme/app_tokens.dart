import 'package:flutter/material.dart';

/// Terrava design tokens — deep forest slate + soft sage accent.
abstract final class AppColors {
  // Brand
  static const forest = Color(0xFF1B3A2F);
  static const forestDeep = Color(0xFF102820);
  static const sage = Color(0xFF7A9E8A);
  static const sageSoft = Color(0xFFB7D0C2);
  static const mist = Color(0xFFF3F6F4);
  static const sand = Color(0xFFE8EEE9);
  static const ink = Color(0xFF121A17);
  static const inkMuted = Color(0xFF5C6B64);
  static const danger = Color(0xFFB42318);
  static const warning = Color(0xFFB54708);
  static const success = Color(0xFF027A48);

  // Dark surfaces
  static const night = Color(0xFF0C1411);
  static const nightElevated = Color(0xFF16201C);
  static const nightBorder = Color(0xFF2A3832);
  static const moon = Color(0xFFE7EEEA);
  static const moonMuted = Color(0xFF9AABA3);
}

abstract final class AppSpacing {
  static const xxs = 4.0;
  static const xs = 8.0;
  static const sm = 12.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 48.0;
}

abstract final class AppRadius {
  static const sm = 12.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const pill = 999.0;

  static final smAll = BorderRadius.circular(sm);
  static final mdAll = BorderRadius.circular(md);
  static final lgAll = BorderRadius.circular(lg);
}
