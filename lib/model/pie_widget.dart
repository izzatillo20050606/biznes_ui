import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChRTPage extends StatefulWidget {
  const PieChRTPage({super.key});

  @override
  State<PieChRTPage> createState() => _PieChRTPageState();
}

class _PieChRTPageState extends State<PieChRTPage> {
  String selectedType = "Haftalik";
  int touchedIndex = -1;

  Map<String, List<double>> data = {
    "Haftalik": [25, 16, 12, 10],
    "Oylik": [35, 20, 18, 12],
    "Yillik": [40, 25, 15, 8],
  };

  final categories = [
    {"name": "Oziq-ovqat", "color": Colors.blue},
    {"name": "Transport", "color": Colors.green},
    {"name": "Ko'ngilochar", "color": Colors.orange},
    {"name": "Kiyim", "color": Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    final currentData = data[selectedType]!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Xarajatlar taqsimoti",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  buildTab("Haftalik"),
                  buildTab("Oylik"),
                  buildTab("Yillik"),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              SizedBox(
                width: 110,
                height: 110,
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 30,
                    sectionsSpace: 2,
                    pieTouchData: PieTouchData(
                      touchCallback: (event, response) {
                        setState(() {
                          touchedIndex =
                              response?.touchedSection?.touchedSectionIndex ??
                              -1;
                        });
                      },
                    ),
                    sections: List.generate(categories.length, (i) {
                      return PieChartSectionData(
                        value: currentData[i],
                        color: categories[i]["color"] as Color,
                        radius: i == touchedIndex ? 30 : 25,
                        showTitle: false,
                      );
                    }),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(categories.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: categories[i]["color"] as Color,
                        ),
                        const SizedBox(width: 6),
                        SizedBox(
                          width: 90,
                          child: Text(categories[i]["name"] as String),
                        ),
                        Text("${currentData[i]}%"),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTab(String title) {
    bool isSelected = selectedType == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedType = title;
          touchedIndex = -1;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 11,
            color: isSelected ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }
}
