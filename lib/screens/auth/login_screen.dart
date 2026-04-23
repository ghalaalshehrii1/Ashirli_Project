import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    Navigator.pushReplacementNamed(context, AppRoutes.userType);
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
                Positioned(
                  top: 130,
                  right: -20,
                  child: _CircleDecoration(
                    size: 150,
                    color: const Color(0xFF1592E6).withOpacity(0.75),
                  ),
                ),
                Positioned(
                  bottom: 135,
                  left: -20,
                  child: _CircleDecoration(
                    size: 90,
                    color: const Color(0xFF2DA9F3).withOpacity(0.55),
                  ),
                ),
                Positioned(
                  bottom: 165,
                  right: -28,
                  child: _CircleDecoration(
                    size: 120,
                    color: const Color(0xFF1794E7).withOpacity(0.70),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  left: 55,
                  child: _CircleDecoration(
                    size: 28,
                    color: const Color(0xFF289BE8).withOpacity(0.70),
                  ),
                ),
                Positioned(
                  bottom: 88,
                  left: 95,
                  child: _CircleDecoration(
                    size: 18,
                    color: const Color(0xFF289BE8).withOpacity(0.70),
                  ),
                ),
                Center(
                  child: Container(
                    width: 315,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 28,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.68),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 8),
                          const Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.black87,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 24),
                          _CustomTextField(
                            controller: emailController,
                            hintText: 'ادخل البريد الإلكتروني',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 14),
                          _CustomTextField(
                            controller: passwordController,
                            hintText: 'ادخل كلمة المرور',
                            obscureText: obscurePassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          const SizedBox(height: 22),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0B8FDE),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.register,
                                  );
                                },
                                child: const Text(
                                  'إنشاء حساب',
                                  style: TextStyle(
                                    color: Color(0xFF0B8FDE),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'ليس لديك حساب؟',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
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
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const _CustomTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hintText,
        hintTextDirection: TextDirection.rtl,
        suffixIcon: suffixIcon,
        filled: false,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 14,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFB8C2CC),
            width: 1,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF0B8FDE),
            width: 1.4,
          ),
        ),
      ),
    );
  }
}

class _CircleDecoration extends StatelessWidget {
  final double size;
  final Color color;

  const _CircleDecoration({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'أشر لي',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Color(0xFF76B8E8),
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}