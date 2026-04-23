import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  void _goToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAEB6D1),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 360,
            margin: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F8FF),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Stack(
              children: [
                const Positioned(
                  top: 40,
                  left: 18,
                  child: _FadedLogo(),
                ),
                const Positioned(
                  bottom: 55,
                  left: 38,
                  child: _FadedLogo(),
                ),

                Center(
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 26,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'تحقق من بريدك الإلكتروني',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        const Text(
                          'تم إرسال رابط التحقق إلى بريدك الإلكتروني.\nيرجى التحقق من بريدك ثم الضغط على الزر أدناه.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 22),

                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () => _goToLogin(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0B8FDE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'تحقق من البريد الإلكتروني',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تم إعادة إرسال البريد'),
                              ),
                            );
                          },
                          child: const Text(
                            'إعادة الإرسال',
                            style: TextStyle(color: Color(0xFF0B8FDE)),
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

class _FadedLogo extends StatelessWidget {
  const _FadedLogo();

  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: 0.18,
      child: Text(
        'أشر لي',
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          color: Color(0xFF76B8E8),
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}