import 'dart:ui';

import 'package:biznes_ui/BOSHQARUV_PANELI/all_active_page.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/daromad_add_page.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/delete_page.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/edit.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/notication_page.dart';
import 'package:flutter/material.dart';

class BoshqaruvPaneli extends StatefulWidget {
  const BoshqaruvPaneli({super.key});

  @override
  State<BoshqaruvPaneli> createState() => _DashboardState();
}

class _DashboardState extends State<BoshqaruvPaneli> {
  int myIndex = 0;
  double balance = 0;
  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        TextEditingController amountController = TextEditingController(
          text: "12000",
        );
        TextEditingController noteController = TextEditingController();

        String selectedCategory = "Sovg'a";
        DateTime selectedDate = DateTime.now();

        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.orange),
                      SizedBox(width: 8),
                      Text(
                        "Daromad qo'shish",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Daromad ma'lumotlarini kiriting"),
                  ),

                  SizedBox(height: 16),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("MIQDOR (SO'M) *"),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("KATEGORIYA *"),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: ["Nafaqa", "Sovg'a", "Ish"]
                        .map(
                          (e) => Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = e;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: selectedCategory == e
                                      ? Colors.blue
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    color: selectedCategory == e
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  SizedBox(height: 16),

                  Align(alignment: Alignment.centerLeft, child: Text("SANA")),
                  SizedBox(height: 6),

                  InkWell(
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );

                      if (picked != null) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text("${selectedDate.toLocal()}".split(' ')[0]),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("IZOH (IXTIYORIY)"),
                  ),
                  SizedBox(height: 6),

                  TextField(
                    controller: noteController,
                    decoration: InputDecoration(
                      hintText: "Bu nima uchun edi?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.black,
                          ),
                          child: Text("Bekor"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            double amount =
                                double.tryParse(amountController.text) ?? 0;

                            setState(() {
                              balance += amount;
                            });

                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: Text("Saqlash ✓"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void addMoney() => setState(() => balance += 50000);
  void removeMoney() => setState(() => balance -= 30000);
  final List<Map<String, dynamic>> history = [
    {"title": "Haftalik nafaqa", "amount": "+200 000", "color": Colors.green},
    {"title": "Oziq-ovqat", "amount": "-45 000", "color": Colors.red},
    {"title": "Transport", "amount": "-12 500", "color": Colors.red},
    {"title": "Internet to‘lovi", "amount": "-80 000", "color": Colors.red},
    {"title": "Maosh", "amount": "+3 500 000", "color": Colors.green},
    {"title": "Kafe", "amount": "-60 000", "color": Colors.red},
    {"title": "Kitob xaridi", "amount": "-120 000", "color": Colors.red},
    {"title": "Bonus", "amount": "+500 000", "color": Colors.green},
    {"title": "Elektr energiya", "amount": "-150 000", "color": Colors.red},
    {"title": "Suv to‘lovi", "amount": "-70 000", "color": Colors.red},
    {"title": "Telefon balans", "amount": "-30 000", "color": Colors.red},
    {"title": "Freelance ish", "amount": "+1 200 000", "color": Colors.green},
    {"title": "Kiyim xaridi", "amount": "-300 000", "color": Colors.red},
    {"title": "Sport zal", "amount": "-200 000", "color": Colors.red},
    {"title": "Sovg‘a", "amount": "-100 000", "color": Colors.red},
    {"title": "Dividend", "amount": "+400 000", "color": Colors.green},
    {"title": "Taksi", "amount": "-25 000", "color": Colors.red},
    {
      "title": "Ovqat yetkazib berish",
      "amount": "-90 000",
      "color": Colors.red,
    },
    {
      "title": "Investitsiya daromadi",
      "amount": "+800 000",
      "color": Colors.green,
    },
    {"title": "Dorixona", "amount": "-55 000", "color": Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Boshqaruv Paneli",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationPage()),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 248, 250, 252),

      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "JORIY BALANS",
                            style: TextStyle(color: Colors.white70),
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                color: Colors.white.withOpacity(0.2),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Edit_page(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                color: Colors.white.withOpacity(0.2),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DeletePage(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${balance.toStringAsFixed(0)} so'm",
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                showmodelBottomSheet(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.withOpacity(0.7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                " + Pul qo'shish",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: removeMoney,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange.withOpacity(0.7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                " - Pul olsh",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "+ Yangi maqsad qo'shish",
                  style: TextStyle(color: Colors.blue),
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
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: history.length > 5 ? 5 : history.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.attach_money,
                                color: Colors.white,
                              ),
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
      ),
    );
  }
}  

void showmodelBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return DaromadAddPage(onSave: (amount, category) {});
    },
  );
}
