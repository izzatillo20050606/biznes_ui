import 'package:biznes_ui/auth/auth1.dart';
import 'package:flutter/material.dart';

class Slash3 extends StatelessWidget {
  const Slash3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Auth1(),
                      ),
                    );
                  },
                  child: const Text("O'tkazib yuborish →"),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ dot(false), dot(false),dot(true)],
              ),

              const SizedBox(height: 30),
              const Text(
                "Sizni nima kutadi?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                "Fundoo bilan moliyaviy hayotingizni to‘liq nazorat qiling",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: const [
                    CustomCard(
                      icon: Icons.show_chart,
                      title: "Tahlil",
                      subtitle: "Xarajat va daromad taqsimoti",
                    ),
                    CustomCard(
                      icon: Icons.track_changes,
                      title: "Maqsadlar",
                      subtitle: "Aniq reja bilan oldinga boring",
                    ),
                    CustomCard(
                      icon: Icons.sports_esports,
                      title: "O'yinlar",
                      subtitle: "O'yin orqali moliya o'rganing",
                    ),
                    CustomCard(
                      icon: Icons.notifications,
                      title: "Eslatmalar",
                      subtitle: "Maqsad signallari",
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Auth1(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3A6FE2), Color(0xFF5B8DEF)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      "Boshlash 🚀",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
class CustomCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CustomCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.blue),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}