import 'package:flutter/material.dart';
import '../../../routes/app_routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _backgroundSOS = true;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("⚙️ Settings"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: _backgroundSOS,
            onChanged: (val) {
              setState(() {
                _backgroundSOS = val;
              });
            },
            title: const Text("Enable Background SOS"),
            subtitle: const Text("Triple press volume or power button even when app is closed"),
          ),
          const Divider(),

          SwitchListTile(
            value: _notificationsEnabled,
            onChanged: (val) {
              setState(() {
                _notificationsEnabled = val;
              });
            },
            title: const Text("Enable Notifications"),
            subtitle: const Text("Receive safety alerts and SOS updates"),
          ),
          const Divider(),

          ListTile(
            title: const Text("Passkey Setup"),
            subtitle: const Text("Choose your emergency trigger"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.passkey);
            },
          ),
          const Divider(),

          ListTile(
            title: const Text("About"),
            subtitle: const Text("App information"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.about);
            },
          ),
        ],
      ),
    );
  }
}

class AppRoutes {
  // Existing routes

  static const String passkey = '/passkey'; // Define the passkey route
  static const String about = '/about'; // Define the about route
}
