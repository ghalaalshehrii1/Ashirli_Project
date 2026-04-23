import 'package:flutter/material.dart';

import '../models/session_record.dart';
import '../theme/app_theme.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/mobile_frame.dart';
import 'session_details_screen.dart';

/// List of past sessions (dummy data, UI only).
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const List<SessionRecord> _dummySessions = [
    SessionRecord(
      dateLabel: '١٤ أبريل ٢٠٢٦ — ١٠:٣٠',
      patientName: 'أحمد محمد العتيبي',
      result: 'مرحباً',
      prediction: 'مرحباً',
      confidence: '92٪',
    ),
    SessionRecord(
      dateLabel: '١٣ أبريل ٢٠٢٦ — ١٤:١٥',
      patientName: 'فاطمة علي السعيد',
      result: 'شكراً',
      prediction: 'شكراً',
      confidence: '88٪',
    ),
    SessionRecord(
      dateLabel: '١٢ أبريل ٢٠٢٦ — ٠٩:٠٠',
      patientName: 'خالد عبدالله القحطاني',
      result: 'موعد',
      prediction: 'موعد المتابعة',
      confidence: '76٪',
    ),
    SessionRecord(
      dateLabel: '١٠ أبريل ٢٠٢٦ — ١٦:٤٥',
      patientName: 'نورة سعد المطيري',
      result: 'دواء',
      prediction: 'دواء',
      confidence: '95٪',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: MobileFrame(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.arrow_back_rounded),
                    color: AppColors.text,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.card,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'سجل الجلسات',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.text,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.padH,
                  0,
                  AppSpacing.padH,
                  24,
                ),
                itemCount: _dummySessions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final s = _dummySessions[index];
                  return _SessionTile(
                    record: s,
                    textTheme: textTheme,
                    onTap: () {
                      Navigator.of(context).push<void>(
                        MaterialPageRoute<void>(
                          builder: (_) => SessionDetailsScreen(record: s),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({
    required this.record,
    required this.textTheme,
    required this.onTap,
  });

  final SessionRecord record;
  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppRadius.md),
            boxShadow: AppShadows.card,
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                record.dateLabel,
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 8),
              Text(
                record.patientName,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 8),
              Text(
                'النتيجة',
                style: textTheme.labelMedium?.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 4),
              Text(
                record.result,
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
