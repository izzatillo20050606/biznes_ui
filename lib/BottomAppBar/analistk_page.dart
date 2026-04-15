import 'package:biznes_ui/model/line_chart.dart';
import 'package:biznes_ui/model/line_chart2.dart';
import 'package:biznes_ui/model/pie_widget.dart';
import 'package:flutter/material.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/notication_page.dart';

class AnalistkPage extends StatefulWidget {
  const AnalistkPage({super.key});

  @override
  State<AnalistkPage> createState() => _AnalistkPageState();
}

class _AnalistkPageState extends State<AnalistkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text("Tahlil"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Bu oylik moliyaviy ko'rinish",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jami daromad"),
                      Text(
                        "+650,000 so'm",
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jami xarajat"),
                      Text(
                        "-250,500 so'm",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tejash darajasi"),
                      Text("61%", style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "↑ Umumiy daromad",
                          style: TextStyle(color: Colors.green),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "650,000",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text("so'm", style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "↓ Umumiy xarajat",
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "250,500",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Text("so'm", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: LineChartWidget(LineChartModel.getData(),),
            ),

            const SizedBox(height: 12),

            PieChRTPage(),
          ],
        ),
      ),
    );
  }
}
