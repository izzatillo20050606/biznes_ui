import 'dart:ui';
import 'package:biznes_ui/BOSHQARUV_PANELI/delete_page.dart';
import 'package:biznes_ui/BOSHQARUV_PANELI/edit.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final Function removeMoney;
  final Function showmodelBottomSheet;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.removeMoney,
    required this.showmodelBottomSheet,
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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// JORIY BALANS + edit + delete
              Row(
                children: [
                  const Text(
                    "JORIY BALANS",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const Spacer(),

                  _smallGlassButton(
                    icon: Icons.edit,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Edit_page(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),

                  _smallGlassButton(
                    icon: Icons.delete,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DeletePage(),
                        ),
                      );
                    },
                  )
                ],
              ),

              const SizedBox(height: 8),

              /// BALANCE TEXT
              Text(
                "${balance.toStringAsFixed(0)} so'm",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              /// Tejash Maqsadi
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "TEJASH MAQSADI",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Yangi O'yin Konsoli",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.more_horiz, color: Colors.white54),
                      ],
                    ),

                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: balance / 10000000,
                      color: Colors.greenAccent,
                      backgroundColor: Colors.white24,
                    ),

                    const SizedBox(height: 6),
                    Text(
                      "${balance.toStringAsFixed(0)} / 10,000,000 so'm   |   360 kun qoldi",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// BUTTONS
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => showmodelBottomSheet(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "+ Pul qo'shish",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => removeMoney(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.withOpacity(0.9),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "- Pul olish",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
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
    );
  }

  /// Glass Icon Button
  Widget _smallGlassButton({required IconData icon, required Function onTap}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.white.withOpacity(0.15),
          child: IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: () => onTap(),
          ),
        ),
      ),
    );
  }
}
