import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      "Welcome to SOS!",
      "Add Trusted Contacts for safety",
      "Join Community Updates",
    ];

    return Scaffold(
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(pages[index], style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 40),
                if (index == pages.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to login
                    },
                    child: const Text("Get Started"),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
