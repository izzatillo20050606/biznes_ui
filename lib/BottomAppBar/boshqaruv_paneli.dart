import 'dart:ui';
import 'package:biznes_ui/l10n/app_localizations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/all_active_page.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/notication_page.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/daromad_add_page.dart';

class BoshqaruvPaneli extends StatefulWidget {
  const BoshqaruvPaneli({super.key});

  @override
  State<BoshqaruvPaneli> createState() => _BoshqaruvPaneliState();
}

class _BoshqaruvPaneliState extends State<BoshqaruvPaneli> {
  double balance = 0;

  void removeMoney() => setState(() => balance -= 30000);

  final List<Map<String, dynamic>> history = [
    {"title": "food", "amount": "-45 000", "color": Colors.red},
    {"title": "transport", "amount": "-12 500", "color": Colors.red},
    {"title": "internet", "amount": "-80 000", "color": Colors.red},
    {"title": "salary", "amount": "+3 500 000", "color": Colors.green},
  ];

  void showmodelBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DaromadAddPage(
          onSave: (amount, category) {
            setState(() {
              balance += amount;
            });
          },
        );
      },
    );
  }

  String tr(AppLocalizations t, String key) {
    switch (key) {
      case "food":
        return t.food;
      case "transport":
        return t.transport;
      case "internet":
        return t.internet;
      case "salary":
        return t.salary;
      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 242, 242),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          t.dashboard,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationPage()),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          BalanceCard(
            balance: balance,
            onAdd: () => showmodelBottomSheet(context),
            onRemove: removeMoney,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: DottedBorder(
              color: Colors.blue,
              strokeWidth: 2,
              dashPattern: const [6, 3],
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    t.add_new_goal,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.last_activity,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AllActivePage(history: history),
                            ),
                          );
                        },
                        child: Text(
                          t.all,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: history.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.attach_money),
                          ),

                          title: Text(
                            tr(t, history[i]["title"]),
                          ),

                          trailing: Text(
                            history[i]["amount"],
                            style: TextStyle(
                              color: history[i]["color"],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  final double balance;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Joriy balans",
            style: TextStyle(color: Colors.white70),
          ),
          Text(
            "${balance.toStringAsFixed(0)} so'm",
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: onAdd,
                child: const Text("+ qo‘shish"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: onRemove,
                child: const Text("- olish"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}