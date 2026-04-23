import 'dart:math' show min;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'result_screen.dart';

/// Camera placeholder — UI only.
class CameraScreen extends StatelessWidget {
  const CameraScreen({
    super.key,
    this.patientName,
  });

  final String? patientName;

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
                          patientName != null && patientName!.isNotEmpty
                              ? 'الكاميرا — $patientName'
                              : 'الكاميرا',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.placeholderGray,
                              borderRadius:
                                  BorderRadius.circular(AppRadius.md),
                              border: Border.all(
                                color:
                                    AppColors.textMuted.withValues(alpha: 0.2),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.videocam_outlined,
                                size: 56,
                                color:
                                    AppColors.textMuted.withValues(alpha: 0.45),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        FilledButton(
                          onPressed: () {
                            Navigator.of(context).push<void>(
                              MaterialPageRoute<void>(
                                builder: (_) => const ResultScreen(),
                              ),
                            );
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.md),
                            ),
                          ),
                          child: const Text(
                            'التقاط',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
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
}
