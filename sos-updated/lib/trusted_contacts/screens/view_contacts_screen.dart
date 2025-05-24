import 'package:flutter/material.dart';

class TrustedContactsScreen extends StatelessWidget {
  const TrustedContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {"name": "Mom", "phone": "9876543210", "relation": "Mother"},
      {"name": "Raj", "phone": "9876543211", "relation": "Friend"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Trusted Contacts")),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              title: Text(contact["name"] ?? ""),
              subtitle: Text("${contact["phone"]} • ${contact["relation"]}"),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Navigate to edit screen
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add contact
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
