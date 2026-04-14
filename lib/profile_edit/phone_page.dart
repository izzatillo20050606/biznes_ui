import 'package:flutter/material.dart';

class PhonePage extends StatefulWidget {
  final String phone;

  const PhonePage({super.key, required this.phone});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  late TextEditingController phone;
  TextEditingController newPhone = TextEditingController();

  @override
  void initState() {
    super.initState();
    phone = TextEditingController(text: widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Telefon raqami")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Telefon raqamingizni o'zgartirish uchun avval yangi\n raqamni tasdiqlashingiz kerak.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              "Joriy raqam: ",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "yosh",
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
            const SizedBox(height: 20),
            Text(
              "Yangi raqam: ",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),

            TextField(
              keyboardType: TextInputType.phone,
              controller: newPhone,
              decoration: InputDecoration(
                hintText: "Yangi raqam ...",
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, newPhone.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 20,
                ),
              ),
              child: const Text(
                "Kodni yuborinsh",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
