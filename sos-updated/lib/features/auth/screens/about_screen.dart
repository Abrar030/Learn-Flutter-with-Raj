import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Text("NARIII - SOS Safety App", style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            Text("Version: 1.0.0"),
            Text("Developed by: Shik Ayesha Mizba"),
            Text("Contact: support@narrii.app"),
          ],
        ),
      ),
    );
  }
}
