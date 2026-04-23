import 'package:flutter/material.dart';
import 'session_completed_screen.dart';

class TextChatScreen extends StatefulWidget {
  const TextChatScreen({super.key});

  @override
  State<TextChatScreen> createState() => _TextChatScreenState();
}

class _TextChatScreenState extends State<TextChatScreen> {
  final TextEditingController controller = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      'text': 'مرحباً صالح، هل تشعر بأي صعوبة في التنفس الآن؟',
      'isMe': false,
    },
    {
      'text': 'نعم دكتور، أشعر بضيق بسيط في صدري عند الحركة.',
      'isMe': true,
    },
    {
      'text': 'فهمت، هل استخدمت جهاز الاستنشاق اليوم؟',
      'isMe': false,
    },
  ];

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        'text': controller.text.trim(),
        'isMe': true,
      });
    });

    controller.clear();
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
                          'الدردشة النصية البديلة',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'في حال تعذر استخدام الكاميرا، يمكنك متابعة الجلسة عبر المحادثة النصية.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),

                const SizedBox(height: 12),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];

                      return Align(
                        alignment: msg['isMe']
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(12),
                          constraints: const BoxConstraints(maxWidth: 250),
                          decoration: BoxDecoration(
                            color: msg['isMe']
                                ? const Color(0xFF0B8FDE)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: msg['isMe']
                                ? null
                                : Border.all(color: Colors.black12),
                          ),
                          child: Text(
                            msg['text'],
                            style: TextStyle(
                              color:
                                  msg['isMe'] ? Colors.white : Colors.black87,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SessionCompletedScreen(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF0B8FDE)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: const Text(
                        'إنهاء الجلسة',
                        style: TextStyle(
                          color: Color(0xFF0B8FDE),
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(28),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: sendMessage,
                        icon: const Icon(Icons.send, color: Colors.blue),
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          textAlign: TextAlign.right,
                          decoration: const InputDecoration(
                            hintText: 'اكتب هنا...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
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