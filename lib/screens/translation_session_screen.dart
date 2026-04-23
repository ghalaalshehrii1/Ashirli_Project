import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/mobile_frame.dart';

/// Translation session UI — camera placeholder, capture, result (UI only).
class TranslationSessionScreen extends StatefulWidget {
  const TranslationSessionScreen({
    super.key,
    this.sessionNumber = 1,
  });

  final int sessionNumber;

  @override
  State<TranslationSessionScreen> createState() =>
      _TranslationSessionScreenState();
}

class _TranslationSessionScreenState extends State<TranslationSessionScreen> {
  final TextEditingController _doctorMessageController = TextEditingController();

  @override
  void dispose() {
    _doctorMessageController.dispose();
    super.dispose();
  }

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
            _buildTopBar(context, textTheme),
            Expanded(
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
                    _buildCameraCard(textTheme),
                    const SizedBox(height: 14),
                    _buildCaptureRow(context),
                    const SizedBox(height: 16),
                    _buildResultSection(textTheme),
                    const SizedBox(height: 14),
                    _buildDoctorInput(textTheme),
                    const SizedBox(height: 12),
                    _buildSendButton(context),
                    const SizedBox(height: 12),
                    _buildAltChatButton(context),
                    const SizedBox(height: 14),
                    _buildPrimaryButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, TextTheme textTheme) {
    return Padding(
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
              'الجلسة رقم ${widget.sessionNumber}',
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
    );
  }

  Widget _buildCameraCard(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'الكاميرا (للمريض)',
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 12),
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.placeholderGray,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(
                  color: AppColors.textMuted.withValues(alpha: 0.2),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.videocam_outlined,
                  size: 48,
                  color: AppColors.textMuted.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Capture circle — UI only (no navigation).
  Widget _buildCaptureButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text('تم الالتقاط (واجهة فقط)'),
            ),
          );
        },
        customBorder: const CircleBorder(),
        child: Ink(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.card,
            boxShadow: AppShadows.card,
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.35),
              width: 3,
            ),
          ),
          child: Center(
            child: Container(
              width: 58,
              height: 58,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCaptureRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'اضغط “التقاط” لتجربة الترجمة (واجهة فقط)',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                  height: 1.35,
                ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 12),
        _buildCaptureButton(context),
      ],
    );
  }

  Widget _buildResultSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'النص المترجم',
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 10),
          Text(
            'سيظهر النص المترجم هنا بعد التقاط الإشارة ومعالجتها.',
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
              height: 1.45,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorInput(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'كتابة الطبيب',
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _doctorMessageController,
            textInputAction: TextInputAction.send,
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'اكتب رسالة للمريض…',
              filled: true,
              fillColor: AppColors.background,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.sm),
                borderSide: BorderSide(
                  color: AppColors.primary.withValues(alpha: 0.18),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.sm),
                borderSide: BorderSide(
                  color: AppColors.primary.withValues(alpha: 0.18),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.sm),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
            onSubmitted: (_) => _onSendPressed(),
          ),
        ],
      ),
    );
  }

  void _onSendPressed() {
    final text = _doctorMessageController.text.trim();
    if (text.isEmpty) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('تم الإرسال: $text (واجهة فقط)'),
      ),
    );
    _doctorMessageController.clear();
  }

  Widget _buildSendButton(BuildContext context) {
    return FilledButton.icon(
      onPressed: _onSendPressed,
      icon: const Icon(Icons.send_rounded, size: 18),
      label: const Text(
        'إرسال',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
  }

  Widget _buildAltChatButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('الدردشة البديلة — قريباً (واجهة فقط)'),
          ),
        );
      },
      icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
      label: const Text(
        'الدردشة البديلة',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: BorderSide(color: AppColors.primary.withValues(alpha: 0.6)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return FilledButton(
      onPressed: () => Navigator.of(context).pushNamed('/success'),
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
      child: const Text(
        'اضغط هنا لمشاهدة النص',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    );
  }
}
