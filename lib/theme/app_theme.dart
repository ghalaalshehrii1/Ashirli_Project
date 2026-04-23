import 'package:flutter/material.dart';

/// Shared design tokens for the medical sign-language app.
///
/// Keep colors, radii, spacing, and shadows here so screens stay consistent
/// and don't redeclare the same constants.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF5DADE2);
  static const Color background = Color(0xFFEAF4FB);
  static const Color card = Color(0xFFFFFFFF);
  static const Color text = Color(0xFF1E293B);
  static const Color textMuted = Color(0xFF64748B);
  static const Color placeholderGray = Color(0xFFE2E8F0);

  static const Color accentHistory = Color(0xFF7C3AED);
  static const Color accentMedical = Color(0xFFD97706);
}

class AppRadius {
  AppRadius._();

  static const double lg = 20;
  static const double md = 18;
  static const double sm = 16;
}

class AppSpacing {
  AppSpacing._();

  static const double padH = 18;
  static const double padV = 16;

  /// Mobile-first column width; keeps web from stretching full viewport.
  static const double maxContentWidth = 360;
}

class AppShadows {
  AppShadows._();

  static List<BoxShadow> get card => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
        BoxShadow(
          color: AppColors.primary.withValues(alpha: 0.08),
          blurRadius: 12,
          offset: const Offset(0, 2),
        ),
      ];
}
