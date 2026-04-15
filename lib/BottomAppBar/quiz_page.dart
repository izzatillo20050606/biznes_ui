import 'package:biznes_ui/BOSHQARUV_PANELI/notication_page.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "O'yinlar",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              MaterialPageRoute(builder: (context) => const NotificationPage());
            },
            icon: Icon(Icons.notifications, color: Colors.yellow),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 239, 91, 202),
                    Color.fromARGB(255, 226, 58, 198),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "🎮",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Tez orada...",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                "Moliyaviy bilimlarni o'yin orqali\n o'rganadigan qiziqarli o'yinlar\n tayyorlanmoqda. Kutib turing!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Bu oddiy xabar!"),
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                child: Text("Tez orada ishlaydi"),
              ),
              child: Text(
                "🚀 Tez orada",
                style: TextStyle(color: const Color.fromARGB(255, 255, 0, 217)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
