import 'package:flutter/material.dart';

class TextChatScreen extends StatefulWidget {
  const TextChatScreen({super.key});

  @override
  State<TextChatScreen> createState() => _TextChatScreenState();
}

class _TextChatScreenState extends State<TextChatScreen> {
  final TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> messages = [
    {'text': 'مرحباً صالح، هل تشعر بأي صعوبة في التنفس؟', 'isMe': false},
    {'text': 'نعم دكتور، أشعر بضيق بسيط', 'isMe': true},
    {'text': 'هل استخدمت جهاز الاستنشاق اليوم؟', 'isMe': false},
  ];

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        'text': controller.text,
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
                // 🔝 الهيدر
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

                // 💬 الرسائل
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
                          decoration: BoxDecoration(
                            color: msg['isMe']
                                ? Colors.blue
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            msg['text'],
                            style: TextStyle(
                              color:
                                  msg['isMe'] ? Colors.white : Colors.black,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // ✍️ الإدخال
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