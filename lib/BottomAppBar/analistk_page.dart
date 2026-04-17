import 'package:biznes_ui/l10n/app_localizations.dart';
import 'package:biznes_ui/model/line_chart2.dart';
import 'package:flutter/material.dart';
import 'package:biznes_ui/model/line_chart.dart';
import 'package:biznes_ui/model/pie_widget.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/notication_page.dart';

class AnalistkPage extends StatefulWidget {
  const AnalistkPage({super.key});

  @override
  State<AnalistkPage> createState() => _AnalistkPageState();
}

class _AnalistkPageState extends State<AnalistkPage> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        title: Text(t.analytics),
        backgroundColor: Colors.white,
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade300,
            ),
            child: IconButton(
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
                children: [

                  Text(
                    t.monthly_finance,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  _row(t.total_income, "+650,000"),
                  const Divider(),
                  _row(t.total_expense, "-250,500"),
                  const Divider(),
                  _row(t.saving_rate, "61%"),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _incomeCard(t.overall_income)),
                const SizedBox(width: 10),
                Expanded(child: _expenseCard(t.overall_expense)),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: LineChartWidget(LineChartModel.getData()),
            ),

            const SizedBox(height: 12),

            const PieChRTPage(),
          ],
        ),
      ),
    );
  }

  Widget _row(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }

  Widget _incomeCard(String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("↑ $title", style: const TextStyle(color: Colors.green)),
          const SizedBox(height: 6),
          const Text(
            "650,000",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _expenseCard(String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("↓ $title", style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 6),
          const Text(
            "250,500",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}