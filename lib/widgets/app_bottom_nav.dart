import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../screens/account_screen.dart';
import '../screens/history_screen.dart';
import '../screens/home_screen.dart';

/// App bottom navigation (3 main tabs).
///
/// Uses pushReplacement to avoid stacking multiple root tabs.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      height: 66,
      backgroundColor: AppColors.card,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      indicatorColor: AppColors.primary.withValues(alpha: 0.18),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: (i) {
        if (i == currentIndex) return;

        Widget target;
        switch (i) {
          case 0:
            target = const HomeScreen();
            break;
          case 1:
            target = const HistoryScreen();
            break;
          default:
            target = const AccountScreen();
        }

        Navigator.of(context).pushReplacement<void, void>(
          MaterialPageRoute<void>(builder: (_) => target),
        );
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined, color: AppColors.textMuted),
          selectedIcon: Icon(Icons.home_rounded, color: AppColors.primary),
          label: 'الرئيسية',
        ),
        NavigationDestination(
          icon: Icon(Icons.history_outlined, color: AppColors.textMuted),
          selectedIcon: Icon(Icons.history_rounded, color: AppColors.primary),
          label: 'الجلسات',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline_rounded, color: AppColors.textMuted),
          selectedIcon: Icon(Icons.person_rounded, color: AppColors.primary),
          label: 'الحساب',
        ),
      ],
    );
  }
}

