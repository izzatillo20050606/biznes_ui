import 'package:flutter/material.dart';

class DaromadAddPage extends StatefulWidget {
  final Function(double amount, String category) onSave;

  const DaromadAddPage({super.key, required this.onSave});

  @override
  State<DaromadAddPage> createState() => _AddIncomeSheetState();
}

class _AddIncomeSheetState extends State<DaromadAddPage> {
  final TextEditingController amountController = TextEditingController();

  String selectedCategory = "🎁 Sovg'a";

  void save() {
    double? amount = double.tryParse(amountController.text);

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("To'g'ri summa kiriting")));
      return;
    }

    widget.onSave(amount, selectedCategory);
    Navigator.pop(context);
  }

  Widget categoryBtn(String text) {
    bool isSelected = selectedCategory == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.withOpacity(0.1)
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "💰 Daromad qo'shish",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          Text(
            textAlign: TextAlign.start,
            "Daromad ma'lumotlarini kiriting",
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Miqdor (so‘m)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 10,

            runSpacing: 10,
            children: [
              categoryBtn("💰 Nafaqa"),
              categoryBtn("🎁 Sovg'a"),
              categoryBtn("💼 Ish"),
              categoryBtn("➕ Boshqa"),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            textAlign: TextAlign.start,
            "Sana ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "kk.oo.yyyy",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Text(
            textAlign: TextAlign.start,
            "Izoh (ixtiyoriy) ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Bu nima uchun edi?",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                  ),
                  child: const Text(
                    "Bekor",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Saqlash ✓"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
