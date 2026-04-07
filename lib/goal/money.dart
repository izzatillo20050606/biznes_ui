import 'package:biznes_ui/goal/money2.dart';
import 'package:flutter/material.dart';

class Money extends StatefulWidget {
  const Money({super.key});

  @override
  State<Money> createState() => _AmountPageState();
}

class _AmountPageState extends State<Money> {
  final TextEditingController summaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Orzuingiz nima? ✨",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            const Text(
              "Nimaga erishmoqchi ekanligingizni ayting.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Orzuingizga erishish uchun zarur bo'lgan miqdorni belgilang.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 40),

              ValueListenableBuilder(
              valueListenable: summaController,
              builder: (context, TextEditingValue value, _) {
                return Text(
                  value.text.isEmpty
                      ? "0 so'm"
                      : "${value.text} so'm",
                   style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

            const Text(
              "Maqsad miqdori (so'm)",
              style: TextStyle(color: Color.fromARGB(255, 103, 102, 102), fontSize: 16),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: summaController, 
              
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Summani kiriting",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const Spacer(),

            ValueListenableBuilder(
              valueListenable: summaController,
              builder: (context, TextEditingValue value, _) {
                return SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: value.text.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Money2(summa: value.text),
                              ),
                            );
                          },
                    child: const Text("Davom etish"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}