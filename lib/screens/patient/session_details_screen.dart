import 'package:flutter/material.dart';
import '../../models/session_model.dart';

class SessionDetailsScreen extends StatelessWidget {
  final SessionModel session;

  const SessionDetailsScreen({
    super.key,
    required this.session,
  });

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
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const Text(
                  'سجل الجلسة',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _box(
                  'ملخص الجلسة:\n'
                  '1- العنوان: ${session.title}\n'
                  '2- التاريخ: ${session.date}\n'
                  '3- الوقت: ${session.time}\n'
                  '4- الحالة: ${session.status}\n'
                  '5- النتيجة: ${session.result}',
                ),
                _box(
                  'الطبيب:\n'
                  '${session.doctorName}\n'
                  '${session.doctorSpecialty}',
                ),
                _box(
                  'ملاحظة:\n${session.note}',
                ),
                _box(
                  'نص المحادثة:\n${session.conversation}',
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('تحميل / طباعة'),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('العودة'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _box(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}