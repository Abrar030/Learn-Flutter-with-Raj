import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final communities = ["Local Safety", "City Alerts", "National Security"];

    return Scaffold(
      appBar: AppBar(title: const Text("Communities")),
      body: ListView.builder(
        itemCount: communities.length,
        itemBuilder: (context, index) {
          final joined = index % 2 == 0;
          return ListTile(
            title: Text(communities[index]),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Text(joined ? "Joined" : "Join"),
            ),
            onTap: () {
              // Navigate to detail screen
            },
          );
        },
      ),
    );
  }
}
