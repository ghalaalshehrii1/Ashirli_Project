import 'package:flutter/material.dart';
import '../patient/session_screen.dart';

class ActiveSessionsScreen extends StatelessWidget {
  const ActiveSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activeSessions = [
      {
        'patient': 'صالح محمد',
        'time': '2:35 م',
        'status': 'نشطة الآن',
      },
      {
        'patient': 'سارة خالد',
        'time': '3:10 م',
        'status': 'قيد المتابعة',
      },
      {
        'patient': 'أحمد علي',
        'time': '4:00 م',
        'status': 'بانتظار البدء',
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
                          'الجلسات النشطة',
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
                    itemCount: activeSessions.length,
                    itemBuilder: (context, index) {
                      final session = activeSessions[index];
                      return _sessionCard(
                        context: context,
                        patient: session['patient']!,
                        time: session['time']!,
                        status: session['status']!,
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
    required String time,
    required String status,
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
            'الوقت: $time',
            style: const TextStyle(color: Colors.black54),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 4),
          Text(
            'الحالة: $status',
            style: const TextStyle(color: Colors.green),
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
                    builder: (context) => const PatientSessionScreen(),
                  ),
                );
              },
              child: const Text('فتح الجلسة'),
            ),
          ),
        ],
      ),
    );
  }
}