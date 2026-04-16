import 'package:flutter/material.dart';

class AllActivePage extends StatelessWidget {
  final List<Map<String, dynamic>> history;

  const AllActivePage({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Barcha faoliyatlar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, i) {
                  final item = history[i];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),

                    child: ListTile(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // drag indicator
                                  Container(
                                    width: 40,
                                    height: 4,
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),

                                  Text(
                                    "Tranzaksiya",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 20),

                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Icon(Icons.attach_money,
                                          color: Colors.white),
                                    ),
                                    title: Text(item["title"]),
                                    subtitle: Text(
                                      "Sana: ${item["time"] ?? "Noma'lum"}",
                                    ),
                                    trailing: Text(
                                      item["amount"],
                                      style: TextStyle(
                                        color: item["color"],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 20),

                              
                                ],
                              ),
                            );
                          },
                        );
                      },

                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.attach_money, color: Colors.white),
                      ),
                      title: Text(item["title"]),
                      trailing: Text(
                        item["amount"],
                        style: TextStyle(
                          color: item["color"],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}