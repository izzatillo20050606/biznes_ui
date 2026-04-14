import 'package:flutter/material.dart';

// ignore: camel_case_types
class Edit_page extends StatefulWidget {
  const Edit_page({super.key});

  @override
  State<Edit_page> createState() => _Edit_pageState();
}

class _Edit_pageState extends State<Edit_page> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController monthController = TextEditingController();

  void save() {
    String name = nameController.text.trim();
    String amountText = amountController.text.trim();
    String monthText = monthController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Maqsad nomini kiriting")),
      );
      return;
    }

    if (amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Summani kiriting")),
      );
      return;
    }

    double? amount = double.tryParse(amountText);

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("To'g'ri summa kiriting")),
      );
      return;
    }

    if (monthText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Muddatni kiriting")),
      );
      return;
    }

    int? month = int.tryParse(monthText);

    if (month == null || month <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("To'g'ri oy kiriting")),
      );
      return;
    }

    print("Name: $name");
    print("Amount: $amount");
    print("Month: $month");

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              "✏️ Maqsadni tahrirlash",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Maqsad ma'lumotlarini yangilang",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),

            const SizedBox(height: 20),

            const Text("Maqsad nomi"),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Yangi O'yin Konsoli",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text("Maqsad summasi (so'm)"),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "10000000",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text("Muddat (oy)"),
            TextField(
              controller: monthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "12",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                    ),
                    child: const Text(
                      "Bekor",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text("Saqlash ✓"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}