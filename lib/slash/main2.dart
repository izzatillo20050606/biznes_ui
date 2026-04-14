import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GmailButton extends StatelessWidget {
  const GmailButton({super.key});

  Future<void> openGmail() async {
    final Uri gmailApp = Uri.parse(
      "googlegmail://co?to=fundoo@gmail.com&subject=Hello&body=I need help",
    );

    final Uri fallback = Uri.parse(
      "mailto:fundoo@gmail.com?subject=Hello&body=I need help",
    );

    if (await canLaunchUrl(gmailApp)) {
      await launchUrl(gmailApp);
    } else {
      await launchUrl(fallback); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: openGmail,
      child: const Text("Contact via Gmail"),
    );
  }
}