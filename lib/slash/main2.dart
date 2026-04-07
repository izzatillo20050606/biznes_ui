import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Next Page")),
      body: const Center(child: Text("Keyingi sahifa ")),
    );
  }
}

Widget custom({required String title, required int sum}) {
  return Container();
}
