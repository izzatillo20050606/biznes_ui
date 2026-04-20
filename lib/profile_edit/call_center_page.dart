import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallCenterPage extends StatelessWidget {
  const CallCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Qo'llab-quvvatlash",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("💬", style: TextStyle(fontSize: 48)),
            SizedBox(height: 10),
            Text(
              "Qanday yordam kerak?",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              "Bizning jamoa 24 - 48 soat ichida javob beradi",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: openGmail, // 🔥 butun qator bosiladi
                      leading: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9EEF5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.email, color: Colors.blue),
                      ),
                      title: const Text(
                        "Email orqali",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: const Text(
                        "gulomovizzatillo19@gmail.com",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9EEF5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.send, color: Colors.blue),
                      ),
                      title: const Text(
                        "Telegram",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: const Text(
                        "@fundoo_support",
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        print("Telegram bosildi");
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      textAlign: TextAlign.start,
                      "Xabar yozing",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      maxLines: 3,
                      maxLength: 150,
                      decoration: InputDecoration(
                        hintText: "Muammoingizni batafsil yozing...",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Saqlash",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildItem(
  IconData icon,
  String title, {
  String? subtitle,
  VoidCallback? onTap,
}) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.grey.shade100,
      child: Icon(icon, color: Colors.black54),
    ),
    title: Text(title),
    subtitle: subtitle != null ? Text(subtitle) : null,
    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    onTap: onTap,
  );
}

Future<void> openGmail() async {
  final Uri emailUri = Uri(
    scheme: "mailto",

    path: "mailto:gulomovizzatillo19@gmail.com?subject=Salom&body=Yordam kerak",
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    print("Email ochilmadi");
  }
}
