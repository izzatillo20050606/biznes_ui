import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/all_active_page.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/delete_page.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/edit.dart';
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
    {"title": "Haftalik nafaqa", "amount": "+200 000", "color": Colors.green},
    {"title": "Oziq-ovqat", "amount": "-45 000", "color": Colors.red},
    {"title": "Transport", "amount": "-12 500", "color": Colors.red},
    {"title": "Internet to‘lovi", "amount": "-80 000", "color": Colors.red},
    {"title": "Maosh", "amount": "+3 500 000", "color": Colors.green},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Boshqaruv Paneli",
          style: TextStyle(fontWeight: FontWeight.bold),
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
            padding: const EdgeInsetsGeometry.only(left: 16, right: 16),
            child: DottedBorder(
              color: Colors.blue,
              strokeWidth: 2,
              dashPattern: [6, 3],
              borderType: BorderType.RRect,
              radius: Radius.circular(12),

              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "+ Yangi maqsad qo'shish",
                    style: TextStyle(
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
                      const Text(
                        "So'ngi faollik",
                        style: TextStyle(
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
                        child: const Text(
                          "Barchasi",
                          style: TextStyle(color: Colors.blue),
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
                          title: Text(history[i]["title"]),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
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
              const SizedBox(height: 6),
              Text(
                " JORIY BALANS ",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Text(
                "${balance.toStringAsFixed(0)} so'm",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 126,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                " TEJASH MAQSADI ",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              _iconBtn(Icons.edit, () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const Edit_page(),
                                  ),
                                );
                              }),
                              const SizedBox(width: 8),
                              _iconBtn(Icons.delete, () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const DeletePage(),
                                  ),
                                );
                              }),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              " Yangi O'yin Konsoli  ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Stack(
                            children: [
                              Container(
                                height: 6,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Container(
                                height: 6,
                                width: 20,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.greenAccent, Colors.green],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "390,500 / 10,000,000 so'm",
                                style: TextStyle(color: Colors.white70),
                              ),
                              Text(
                                "360 kun qoldi",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: 180,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: onAdd,
                      child: const Text("+ Pul qoshish"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    width: 180,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: onRemove,
                      child: const Text("- Pul olish"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconBtn(IconData icon, Function onTap) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.white.withOpacity(0.1),
          child: IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: () => onTap(),
          ),
        ),
      ),
    );
  }
}
