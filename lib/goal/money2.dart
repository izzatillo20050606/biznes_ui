import 'package:flutter/material.dart';

class Money2 extends StatefulWidget {
  const Money2({super.key, required String summa});

  @override
  // ignore: library_private_types_in_public_api
  _AmountPageState createState() => _AmountPageState();
}

class _AmountPageState extends State<Money2> {
  String summa = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              summa.isEmpty ? "0 so'm" : "$summa so'm",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 40),

            Text(
              "Joriy miqdori (so'm)",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                hintText: "Summani kiriting",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFF2A2A3D),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  summa = value;
                });
              },
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text("ℹ️", style: const TextStyle(fontSize: 20)),
                  Expanded(
                    child: Text(
                      "Siz ushbu balansni istalgan vaqtda yangilashingiz mumkin.",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: summa.isEmpty
                    ? null
                    : () { 
                        print("Davom etish: $summa");
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  disabledBackgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Davom etish",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
