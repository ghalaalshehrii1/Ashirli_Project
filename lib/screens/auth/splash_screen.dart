import 'dart:async';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
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
              color: const Color(0xFFF3F7FF),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Stack(
              children: [
                // الدائرة الكبيرة بالنص
                Positioned(
                  left: 25,
                  right: 25,
                  top: 280,
                  child: Center(
                    child: Container(
                      width: 290,
                      height: 290,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE3F1FF),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                // النصوص الخلفية
                const Positioned(
                  top: 95,
                  left: 40,
                  child: _FadedLogoText(),
                ),
                const Positioned(
                  bottom: 85,
                  left: 50,
                  child: _FadedLogoText(),
                ),

                // الزخارف الجانبية - مؤقتة بدل رسم اليد
                const Positioned(
                  top: 110,
                  right: 12,
                  child: _OutlineDecoration(size: 130),
                ),
                const Positioned(
                  top: 360,
                  right: 18,
                  child: _OutlineDecoration(size: 120),
                ),
                const Positioned(
                  bottom: 55,
                  right: 0,
                  child: _OutlineDecoration(size: 135),
                ),

                // الاسم الرئيسي
                const Positioned.fill(
                  child: Center(
                    child: Text(
                      'أشر لي',
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0C79C9),
                      ),
                    ),
                  ),
                ),

                // دوائر صغيرة
                const Positioned(
                  top: 165,
                  left: 42,
                  child: _Dot(size: 18),
                ),
                const Positioned(
                  top: 205,
                  right: 58,
                  child: _Dot(size: 16),
                ),
                const Positioned(
                  bottom: 285,
                  right: 48,
                  child: _Dot(size: 16),
                ),
                const Positioned(
                  bottom: 180,
                  left: 62,
                  child: _Dot(size: 16),
                ),

                // نجوم خفيفة
                const Positioned(
                  top: 300,
                  right: 72,
                  child: _Spark(),
                ),
                const Positioned(
                  bottom: 245,
                  right: 98,
                  child: _Spark(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FadedLogoText extends StatelessWidget {
  const _FadedLogoText();

  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: 0.18,
      child: Text(
        'أشر لي',
        style: TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.w700,
          color: Color(0xFF76B8E8),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final double size;

  const _Dot({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFF006FC3),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Spark extends StatelessWidget {
  const _Spark();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.auto_awesome,
      size: 24,
      color: const Color(0xFF7EB6E8).withOpacity(0.45),
    );
  }
}

class _OutlineDecoration extends StatelessWidget {
  final double size;

  const _OutlineDecoration({required this.size});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.28,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          border: Border.all(
            color: const Color(0xFF7EB6E8),
            width: 2,
          ),
        ),
      ),
    );
  }
}