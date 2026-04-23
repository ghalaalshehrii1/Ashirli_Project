import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/mobile_frame.dart';
import 'history_screen.dart';
import 'start_session_screen.dart';

/// الشاشة الرئيسية — تحية، بدء الجلسة، سجل الجلسات (واجهة فقط).
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: MobileFrame(
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.padH,
            AppSpacing.padV,
            AppSpacing.padH,
            24,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildLogo(),
              const SizedBox(height: 20),
              _buildGreeting(textTheme),
              const SizedBox(height: 22),
              _buildPrimaryActions(context, textTheme),
              const SizedBox(height: 16),
              _buildFeatureCards(context, textTheme),
              const SizedBox(height: 16),
              _buildSessionsCard(context, textTheme),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }

  Widget _buildLogo() {
    return const Center(
      child: Opacity(
        opacity: 0.22,
        child: Icon(
          Icons.medical_services_rounded,
          size: 52,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildGreeting(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'مرحباً صالح',
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.text,
            height: 1.25,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 6),
        Text(
          'متابعة رعايتك الصحية',
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.textMuted,
            height: 1.35,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }

  Widget _buildPrimaryActions(BuildContext context, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _actionCard(
          context,
          textTheme,
          title: 'ابدأ جلسة',
          subtitle: 'للطبيب — بدء جلسة جديدة مع مريض',
          icon: Icons.play_circle_outline_rounded,
          iconBg: AppColors.primary.withValues(alpha: 0.14),
          iconColor: AppColors.primary,
          onTap: () {
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (_) => const StartSessionScreen(),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        _actionCard(
          context,
          textTheme,
          title: 'انضمام إلى جلسة',
          subtitle: 'للمريض — انضم إلى جلسة حالية (واجهة فقط)',
          icon: Icons.meeting_room_outlined,
          iconBg: AppColors.card,
          iconColor: AppColors.primary,
          outlined: true,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('انضمام إلى جلسة — قريباً (واجهة فقط)'),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFeatureCards(BuildContext context, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _featureCard(
          context,
          textTheme,
          title: 'التعليمات الطبية',
          icon: Icons.assignment_turned_in_outlined,
          iconColor: AppColors.primary,
          onTap: () => Navigator.of(context).pushNamed('/medical-instructions'),
        ),
        const SizedBox(height: 12),
        _featureCard(
          context,
          textTheme,
          title: 'الدردشة البديلة',
          icon: Icons.chat_bubble_outline_rounded,
          iconColor: AppColors.primary,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('الدردشة البديلة — قريباً (واجهة فقط)'),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _actionCard(
    BuildContext context,
    TextTheme textTheme, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required VoidCallback onTap,
    bool outlined = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
            border: outlined
                ? Border.all(
                    color: AppColors.primary.withValues(alpha: 0.22),
                  )
                : null,
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.text,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.textMuted,
                        height: 1.35,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_left_rounded,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featureCard(
    BuildContext context,
    TextTheme textTheme, {
    required String title,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppRadius.md),
            boxShadow: AppShadows.card,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Icon(icon, size: 26, color: iconColor),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Icon(
                Icons.chevron_left_rounded,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// سجل الجلسات — واجهة فقط.
  Widget _buildSessionsCard(BuildContext context, TextTheme textTheme) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push<void>(
            MaterialPageRoute<void>(
              builder: (_) => const HistoryScreen(),
            ),
          );
        },
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppRadius.md),
            boxShadow: AppShadows.card,
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.accentHistory.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: const Icon(
                  Icons.history_rounded,
                  size: 26,
                  color: AppColors.accentHistory,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  'سجل الجلسات',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Icon(
                Icons.chevron_left_rounded,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
