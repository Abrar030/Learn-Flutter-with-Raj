import 'package:flutter/material.dart';

class AddTrustedContactScreen extends StatelessWidget {
  const AddTrustedContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Contact")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Name')),
            TextField(decoration: const InputDecoration(labelText: 'Phone')),
            TextField(decoration: const InputDecoration(labelText: 'Relationship')),
            SwitchListTile(
              title: const Text("Notify Contact"),
              value: true,
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}
