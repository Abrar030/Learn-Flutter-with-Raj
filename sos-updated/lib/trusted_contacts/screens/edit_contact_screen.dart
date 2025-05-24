import 'package:flutter/material.dart';

class EditTrustedContactScreen extends StatelessWidget {
  const EditTrustedContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Contact")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Name'), controller: TextEditingController(text: "Raj")),
            TextField(decoration: const InputDecoration(labelText: 'Phone'), controller: TextEditingController(text: "9876543211")),
            TextField(decoration: const InputDecoration(labelText: 'Relationship'), controller: TextEditingController(text: "Friend")),
            SwitchListTile(
              title: const Text("Notify Contact"),
              value: true,
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Save Changes")),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                // delete logic
              },
              child: const Text("Delete Contact", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
