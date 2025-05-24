import 'package:flutter/material.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final permissions = ["Location", "Camera", "Microphone", "Background Usage"];

    return Scaffold(
      appBar: AppBar(title: const Text("Permissions")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: permissions.map((perm) {
                return CheckboxListTile(
                  title: Text(perm),
                  value: true,
                  onChanged: (val) {},
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Request permissions
              },
              child: const Text("Grant All"),
            ),
          ),
        ],
      ),
    );
  }
}
