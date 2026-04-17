import 'package:biznes_ui/BottomAppBar/analistk_page.dart';
import 'package:biznes_ui/BottomAppBar/boshqaruv_paneli.dart';
import 'package:biznes_ui/BottomAppBar/profile_page.dart';
import 'package:biznes_ui/BottomAppBar/quiz_page.dart';
import 'package:biznes_ui/model/line_chart.dart';
import 'package:flutter/material.dart';

class BottomNB extends StatefulWidget {
  final Function(String) changeLang;

  const BottomNB({super.key, required this.changeLang});

  @override
  State<BottomNB> createState() => _BottomNBState();
}

class _BottomNBState extends State<BottomNB> {
  int myIndex = 0;

  List<Widget> get myList => [
    BoshqaruvPaneli(),
    AnalistkPage(),
    QuizPage(),
    ProfilePage(changeLang: widget.changeLang),
  ];

  List<Map<String, dynamic>> history = [
    {
      "title": "Oziq-ovqat",
      "amount": "-50 000 so'm",
      "color": Colors.red,
      "time": "16.04.2026",
      "category": "Ovqat",
      "desc": "Harajat",
      "balance": "500 000 so'm",
    },
    {
      "title": "Maosh",
      "amount": "+2 000 000 so'm",
      "color": Colors.green,
      "time": "15.04.2026",
      "category": "Daromad",
      "desc": "Kirim",
      "balance": "550 000 so'm",
    },
  ];

  List<LineChartModel> points = [
    LineChartModel(x: 0, y: 20),
    LineChartModel(x: 1, y: 30),
    LineChartModel(x: 2, y: 25),
    LineChartModel(x: 3, y: 40),
    LineChartModel(x: 4, y: 35),
    LineChartModel(x: 5, y: 50),
    LineChartModel(x: 6, y: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myList[myIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myIndex,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Asosiy"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Tahlil"),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: "Quizlar"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}