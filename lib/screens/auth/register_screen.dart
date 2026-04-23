import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (fullNameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('فضلاً عبئي جميع الحقول')),
      );
      return;
    }

    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كلمتا المرور غير متطابقتين')),
      );
      return;
    }

    Navigator.pushNamed(context, AppRoutes.emailVerification);
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
                  top: 125,
                  right: -20,
                  child: _CircleDecoration(
                    size: 150,
                    color: const Color(0xFF1592E6).withOpacity(0.75),
                  ),
                ),
                Positioned(
                  bottom: 160,
                  left: -18,
                  child: _CircleDecoration(
                    size: 82,
                    color: const Color(0xFF2DA9F3).withOpacity(0.55),
                  ),
                ),
                Positioned(
                  bottom: 125,
                  right: -30,
                  child: _CircleDecoration(
                    size: 118,
                    color: const Color(0xFF1794E7).withOpacity(0.70),
                  ),
                ),
                Positioned(
                  bottom: 155,
                  left: 88,
                  child: _CircleDecoration(
                    size: 18,
                    color: const Color(0xFF289BE8).withOpacity(0.70),
                  ),
                ),
                Positioned(
                  bottom: 185,
                  left: 58,
                  child: _CircleDecoration(
                    size: 30,
                    color: const Color(0xFF289BE8).withOpacity(0.70),
                  ),
                ),

                Center(
                  child: Container(
                    width: 315,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 24,
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
                            'إنشاء حساب',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.black87,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 22),

                          _CustomTextField(
                            controller: fullNameController,
                            hintText: 'الاسم الكامل',
                          ),
                          const SizedBox(height: 12),

                          _CustomTextField(
                            controller: emailController,
                            hintText: 'البريد الإلكتروني',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 12),

                          _CustomTextField(
                            controller: passwordController,
                            hintText: 'كلمة المرور',
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
                          const SizedBox(height: 12),

                          _CustomTextField(
                            controller: confirmPasswordController,
                            hintText: 'تأكيد كلمة المرور',
                            obscureText: obscureConfirmPassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureConfirmPassword =
                                      !obscureConfirmPassword;
                                });
                              },
                              icon: Icon(
                                obscureConfirmPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: _register,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0B8FDE),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'استمرار',
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
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.login,
                                  );
                                },
                                child: const Text(
                                  'تسجيل الدخول',
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
                                'لديك حساب بالفعل؟',
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