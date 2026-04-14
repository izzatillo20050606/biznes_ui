import 'package:flutter/material.dart';

class FrqPage extends StatefulWidget {
  const FrqPage({super.key});

  @override
  State<FrqPage> createState() => _FrqPageState();
}

class _FrqPageState extends State<FrqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ko'p beriladigan savollar")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding: EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  title: Text("Fundoo nima? "),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: 16, right: 16),
                      child: Text(
                        "Fundoo — yoshlar uchun mo'ljallangan moliyaviy\n savodxonlik va tejash ilova. Maqsad belgilash,\n daromad/xarajatni kuzatish va moliyaviy\n rejalashtirishda yordam beradi.",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding: EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  title: Text("Balansni qanday qo'shaman? "),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: 16, right: 16),
                      child: Text(
                        "Fundoo — yoshlar uchun mo'ljallangan moliyaviy\n savodxonlik va tejash ilova. Maqsad belgilash,\n daromad/xarajatni kuzatish va moliyaviy\n rejalashtirishda yordam beradi.",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding: EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  title: Text("Balansni qanday qo'shaman? "),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: 16, right: 16),
                      child: Text(
                        "Fundoo — yoshlar uchun mo'ljallangan moliyaviy\n savodxonlik va tejash ilova. Maqsad belgilash,\n daromad/xarajatni kuzatish va moliyaviy\n rejalashtirishda yordam beradi.",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding: EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  title: Text("Balansni qanday qo'shaman? "),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: 16, right: 16),
                      child: Text(
                        "Fundoo — yoshlar uchun mo'ljallangan moliyaviy\n savodxonlik va tejash ilova. Maqsad belgilash,\n daromad/xarajatni kuzatish va moliyaviy\n rejalashtirishda yordam beradi.",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding: EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  title: Text("Balansni qanday qo'shaman? "),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: 16, right: 16),
                      child: Text(
                        "Fundoo — yoshlar uchun mo'ljallangan moliyaviy\n savodxonlik va tejash ilova. Maqsad belgilash,\n daromad/xarajatni kuzatish va moliyaviy\n rejalashtirishda yordam beradi.",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding: EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  title: Text("Balansni qanday qo'shaman? "),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: 16, right: 16),
                      child: Text(
                        "Fundoo — yoshlar uchun mo'ljallangan moliyaviy\n savodxonlik va tejash ilova. Maqsad belgilash,\n daromad/xarajatni kuzatish va moliyaviy\n rejalashtirishda yordam beradi.",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding: EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  title: Text("Balansni qanday qo'shaman? "),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: 16, right: 16),
                      child: Text(
                        "Fundoo — yoshlar uchun mo'ljallangan moliyaviy\n savodxonlik va tejash ilova. Maqsad belgilash,\n daromad/xarajatni kuzatish va moliyaviy\n rejalashtirishda yordam beradi.",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding: EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  title: Text("Balansni qanday qo'shaman? "),
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: 16, right: 16),
                      child: Text(
                        "Fundoo — yoshlar uchun mo'ljallangan moliyaviy\n savodxonlik va tejash ilova. Maqsad belgilash,\n daromad/xarajatni kuzatish va moliyaviy\n rejalashtirishda yordam beradi.",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
