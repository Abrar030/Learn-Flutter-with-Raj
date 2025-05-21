import 'package:flutter/material.dart';
import '../services/volume.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final VolumeService _volumeService = VolumeService();

  @override
  void initState() {
    super.initState();
    _volumeService.startListening(onTrigger: _handleSOSTrigger);
  }

  void _handleSOSTrigger() {
    print("🚨 SOS Triggered!");
    // Future: Trigger recording here
  }

  @override
  void dispose() {
    _volumeService.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SOS Volume Trigger")),
      body: Center(
        child: Text("Press Volume Down 3 times to trigger SOS"),
      ),
    );
  }
}
