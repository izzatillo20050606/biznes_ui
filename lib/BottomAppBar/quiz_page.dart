import 'package:biznes_ui/BOSHQARUV_PANELI/notication_page.dart';
import 'package:biznes_ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.gamesTitle, // "O'yinlar"
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
            icon: const Icon(Icons.notifications, color: Colors.yellow),
          ),
        ],
      ),

      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),

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
                  style: TextStyle(fontSize: 36),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              t.comingSoon, // "Tez orada..."
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              t.gameDescription,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(t.comingSoonMessage),
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: Text(
                t.comingSoonButton,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 0, 217),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}