import 'dart:math' show min;

import 'package:flutter/material.dart';

import '../models/session_record.dart';
import '../theme/app_theme.dart';

/// Single session detail view (UI only).
class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({
    super.key,
    required this.record,
  });

  final SessionRecord record;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    final columnW = min(
      AppSpacing.maxContentWidth,
      mq.width - AppSpacing.padH * 2,
    );
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: columnW,
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
                            borderRadius:
                                BorderRadius.circular(AppRadius.sm),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'تفاصيل الجلسة',
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
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.padH,
                      0,
                      AppSpacing.padH,
                      24,
                    ),
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        boxShadow: AppShadows.card,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _detailRow(
                            textTheme,
                            label: 'التاريخ',
                            value: record.dateLabel,
                          ),
                          const Divider(height: 28),
                          _detailRow(
                            textTheme,
                            label: 'المريض',
                            value: record.patientName,
                          ),
                          const Divider(height: 28),
                          _detailRow(
                            textTheme,
                            label: 'التوقع',
                            value: record.prediction,
                          ),
                          const Divider(height: 28),
                          _detailRow(
                            textTheme,
                            label: 'نسبة الثقة',
                            value: record.confidence,
                            valueColor: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailRow(
    TextTheme textTheme, {
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: valueColor ?? AppColors.text,
            height: 1.35,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
