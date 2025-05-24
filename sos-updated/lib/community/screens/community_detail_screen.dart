import 'package:flutter/material.dart';

class CommunityDetailScreen extends StatelessWidget {
  const CommunityDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      {"author": "Alice", "message": "Be alert near park area."},
      {"author": "Officer", "message": "Curfew after 10 PM today."}
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Community Details")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post["author"] ?? ""),
                  subtitle: Text(post["message"] ?? ""),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Post a message...",
                suffixIcon: Icon(Icons.send),
              ),
            ),
          )
        ],
      ),
    );
  }
}
