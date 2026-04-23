import 'package:flutter/material.dart';

class MedicalInstructionsScreen extends StatelessWidget {
  const MedicalInstructionsScreen({super.key});

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
              gradient: const LinearGradient(
                colors: [Color(0xFFB7D8F5), Color(0xFFEFF5FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                // 🔙 العنوان
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 18),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon:
                            const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      const Expanded(
                        child: Text(
                          'التعليمات الطبية',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),

                // 👨‍⚕️ معلومات الطبيب
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'د. ناصر القحطاني',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'أخصائي أمراض الرئة',
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'تاريخ الجلسة: 28 أكتوبر 2025 - 2:35 م',
                        style: TextStyle(color: Colors.black54),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // 📋 تعليمات الطبيب
                _card(
                  title: 'تعليمات الطبيب:',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text('1- تجنب التعرض للغبار والدخان والهواء البارد.',
                          textDirection: TextDirection.rtl),
                      Text('2- استخدام جهاز الاستنشاق عند الشعور بضيق التنفس.',
                          textDirection: TextDirection.rtl),
                      Text('3- حدد موعد متابعة بعد أسبوع.',
                          textDirection: TextDirection.rtl),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // 💊 الأدوية
                _card(
                  title: 'الأدوية الموصوفة:',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text('• بخاخ فينتولين - عند الحاجة',
                          textDirection: TextDirection.rtl),
                      Text('• مونتيلوكاست - 10 ملغ مرة يومياً لمدة 7 أيام',
                          textDirection: TextDirection.rtl),
                    ],
                  ),
                ),

                const Spacer(),

                // 🔘 الأزرار
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0B8FDE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('تحميل / طباعة'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('العودة إلى الصفحة الرئيسية'),
                      ),
                    ],
                  ),
                ),

                // 🔻 Bottom nav (شكل فقط)
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB7D8F5),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(28),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.home),
                      Icon(Icons.person),
                      Icon(Icons.settings),
                    ],
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

// 🔹 كرت جاهز
Widget _card({required String title, required Widget child}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.black12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        child,
      ],
    ),
  );
}