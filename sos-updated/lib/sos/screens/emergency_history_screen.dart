  import 'package:flutter/material.dart';

class EmergencyHistoryScreen extends StatelessWidget {
  const EmergencyHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sosLogs = [
      {
        "date": "2025-05-24",
        "method": "Volume Button",
        "status": "Sent",
        "video": true,
      },
      {
        "date": "2025-05-22",
        "method": "App Button",
        "status": "Failed",
        "video": false,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Emergency History")),
      body: ListView.builder(
        itemCount: sosLogs.length,
        itemBuilder: (context, index) {
          final log = sosLogs[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text("Date: ${log['date']}"),
              subtitle: Text("Triggered: ${log['method']}\nStatus: ${log['status']}"),
              trailing: log['video']
                  ? const Icon(Icons.videocam, color: Colors.green)
                  : const Icon(Icons.error, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
