import 'package:biznes_ui/model/user_model.dart';
import 'package:flutter/material.dart';

class ShaxsiyMalumotlarPage extends StatefulWidget {
  final UserModel userModel;
  const ShaxsiyMalumotlarPage({super.key, required this.userModel});

  @override
  State<ShaxsiyMalumotlarPage> createState() => _ShaxsiyMalumotlarPageState();
}

class _ShaxsiyMalumotlarPageState extends State<ShaxsiyMalumotlarPage> {
  late TextEditingController userController;
  late TextEditingController nicnameController;
  late TextEditingController bioController;
  late UserModel user;

  @override
  void initState() {
    super.initState();
    userController = TextEditingController(text: widget.userModel.name);
    nicnameController = TextEditingController(text: widget.userModel.username);
    bioController = TextEditingController(text: widget.userModel.bio);
    user = widget.userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shaxsiy malumotlar")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Text("To'liq ism", style: TextStyle(color: Colors.grey)),
            TextField(
              textAlign: TextAlign.start,
              controller: userController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "John Lower",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (v) => user.name = v,
            ),
            SizedBox(height: 20),
            Text("Foydalanuvchi nomi ", style: TextStyle(color: Colors.grey)),
            TextField(
              textAlign: TextAlign.start,
              controller: nicnameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "@nicname",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (v) => user.username = v,
            ),
            SizedBox(height: 20),
            Text("Yosh ", style: TextStyle(color: Colors.grey, fontSize: 22)),
            TextField(
              textAlign: TextAlign.start,
              controller: bioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "yosh",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (v) => user.age = v,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, user);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 20,
                ),
              ),
              child: const Text(
                "Saqlash ",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
