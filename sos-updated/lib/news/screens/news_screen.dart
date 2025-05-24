import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final news = [
      {"title": "City Safety Drive", "summary": "Helmets and seatbelts made mandatory"},
      {"title": "Self Defense Training", "summary": "Free classes for women announced"}
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("News")),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          final article = news[index];
          return ListTile(
            title: Text(article["title"] ?? ""),
            subtitle: Text(article["summary"] ?? ""),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to full article view or launch URL
            },
          );
        },
      ),
    );
  }
}
