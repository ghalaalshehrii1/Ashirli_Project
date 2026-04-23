import 'package:flutter/material.dart';
import 'doctor_session_details_screen.dart';

class DoctorSessionsScreen extends StatelessWidget {
  const DoctorSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sessions = [
      {
        'patient': 'صالح محمد',
        'date': '28 أكتوبر 2025',
        'time': '2:35 م',
      },
      {
        'patient': 'سارة خالد',
        'date': '8 أغسطس 2025',
        'time': '1:45 م',
      },
      {
        'patient': 'أحمد علي',
        'date': '2 أغسطس 2025',
        'time': '12:30 م',
      },
    ];

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
                      const Expanded(
                        child: Text(
                          'سجل الجلسات',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: sessions.length,
                    itemBuilder: (context, index) {
                      final session = sessions[index];
                      return _sessionCard(
                        context: context,
                        patient: session['patient']!,
                        date: session['date']!,
                        time: session['time']!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sessionCard({
    required BuildContext context,
    required String patient,
    required String date,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            patient,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 4),
          Text(
            'التاريخ: $date',
            style: const TextStyle(color: Colors.black54),
            textDirection: TextDirection.rtl,
          ),
          Text(
            'الوقت: $time',
            style: const TextStyle(color: Colors.black54),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorSessionDetailsScreen(
                      patient: patient,
                      date: date,
                      time: time,
                    ),
                  ),
                );
              },
              child: const Text('عرض التفاصيل'),
            ),
          ),
        ],
      ),
    );
  }
}