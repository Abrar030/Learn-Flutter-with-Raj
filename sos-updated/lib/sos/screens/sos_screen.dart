import 'package:flutter/material.dart';

class SOSScreen extends StatelessWidget {
  const SOSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Send SOS")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              onPressed: () {
                // Trigger SOS manually
              },
              child: const Text("Trigger SOS", style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 30),
            const Text("Status: Ready", style: TextStyle(fontSize: 18)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Test SOS logic
              },
              child: const Text("Test SOS"),
            ),
          ],
        ),
      ),
    );
  }
}
