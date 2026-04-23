import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// A reusable “phone-sized” frame for mobile-first UIs.
///
/// - Centers content
/// - Limits width to 360
/// - Applies SafeArea
/// - Adds horizontal padding (default 16)
/// - Uses a light background so the UI doesn't feel stretched on wide screens
class MobileFrame extends StatelessWidget {
  const MobileFrame({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.backgroundColor = AppColors.background,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSpacing.maxContentWidth,
            ),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

