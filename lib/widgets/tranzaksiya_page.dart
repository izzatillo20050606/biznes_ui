import 'package:flutter/material.dart';

Widget card(String title, String subtitle) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(color: Colors.grey, fontSize: 12),
    ),
    subtitle: Text(
      subtitle,
      style: const TextStyle(color: Colors.black, fontSize: 18),
    ),
  );
}

Widget redcard(String title, String subcolor) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(color: Colors.grey, fontSize: 12),
    ),
    subtitle: Text(
      subcolor,
      style: const TextStyle(color: Colors.red, fontSize: 18),
    ),
  );
}

void tranzaksheet(BuildContext context, double balance) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Tranzaksiya",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          SizedBox(height: 16),
          card("Turi", "Chiqim"),
          SizedBox(height: 10),
          redcard("Summa", "-1 000 so'm"),
          SizedBox(height: 10),
          card("Kategoriya", "Salomatlik"),
          SizedBox(height: 10),
          card("Vaqt", DateTime.now().toString()),
          SizedBox(height: 10),
          card("Tavsif", "Harajat"),
          SizedBox(height: 10),
          card("Balance dan keyin", "$balance so'm"),
          SizedBox(height:20),
        ],
      );
    },
  );
}
