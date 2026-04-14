import 'package:biznes_ui/BottomAppBar/boshqaruv_paneli.dart';
import 'package:biznes_ui/BottomAppBar/profile_page.dart';
import 'package:biznes_ui/BottomAppBar/quiz_page.dart';
import 'package:biznes_ui/goal/goal.dart';
import 'package:flutter/material.dart';

class BottomNB extends StatefulWidget {
  const BottomNB({super.key});

  @override
  State<BottomNB> createState() => _BottomNBState();
}

class _BottomNBState extends State<BottomNB> {
  List<Widget> myList = [
    BoshqaruvPaneli(),
    GoalPage(),
    QuizPage(),
    ProfilePage(),
  ];
  int myIndex = 0;
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
