import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'dart:async';

import '../../../core/services/camera_service.dart';
import '../../../core/services/location_service.dart';
import '../../../core/services/gallery_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final CameraService _cameraService = CameraService();
  final LocationService _locationService = LocationService();
  final GalleryService _galleryService = GalleryService();

  bool _isRecording = false;
  bool _permissionsGranted = false;
  int _sosTapCount = 0;
  String _location = "Detecting...";

  late AnimationController _animationController;
  late Animation<double> _animation;

  int _recordSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack),
    );
  }

  Future<void> _initialize() async {
    await Permission.camera.request();
    await Permission.microphone.request();

    if (await Permission.camera.isDenied || await Permission.microphone.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Camera & mic permissions are required")),
      );
      return;
    }

    await _cameraService.initialize();
    final position = await _locationService.getCurrentPosition();
    if (position != null) {
      setState(() {
        _location = "Lat: ${position.latitude}, Long: ${position.longitude}";
      });
    }

    setState(() => _permissionsGranted = true);
  }

  Future<void> _recordSOSVideo() async {
    if (_cameraService.controller == null || !_cameraService.controller!.value.isInitialized) return;

    try {
      setState(() {
        _isRecording = true;
        _recordSeconds = 0;
      });

      // Start timer
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _recordSeconds++;
        });
      });

      final videoFile = await _cameraService.recordVideo(seconds: 5);

      // Stop timer
      _timer?.cancel();
      setState(() {
        _isRecording = false;
        _recordSeconds = 0;
      });

      final position = await _locationService.getCurrentPosition();
      final sosData = {
        "video_path": videoFile.path,
        "timestamp": DateTime.now().toIso8601String(),
        "latitude": position?.latitude ?? 0.0,
        "longitude": position?.longitude ?? 0.0,
      };

      await _galleryService.saveVideo(videoFile.path);

      print("📦 SOS Data: $sosData");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ SOS recorded and saved")),
      );
    } catch (e) {
      _timer?.cancel();
      setState(() {
        _isRecording = false;
        _recordSeconds = 0;
      });
      print("📹 Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Recording failed")),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _cameraService.dispose();
    super.dispose();
  }

  Widget buildQuickTile(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.15),
            radius: 28,
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("🚨 SOS Alert", style: TextStyle(color:Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blueGrey.shade900, Colors.black, Colors.red.shade900.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: !_permissionsGranted
            ? Center(
                child: GestureDetector(
                  onTap: () async {
                    _sosTapCount++;
                    if (_sosTapCount >= 3) await _initialize();
                  },
                  child: Lottie.asset(
                    'assets/sos_button.json',
                    width: 200,
                    height: 200,
                    repeat: true,
                  ),
                ),
              )
            : Column(
                children: [
                  const SizedBox(height: 70),
                  if (_cameraService.controller?.value.isInitialized ?? false)
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _isRecording ? Colors.yellowAccent : Colors.cyanAccent,
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 20,
                          )
                        ],
                      ),
                      height: 200,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CameraPreview(_cameraService.controller!),
                      ),
                    ),
                  const SizedBox(height: 30),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (_, child) => Transform.scale(
                      scale: _animation.value,
                      child: GestureDetector(
                        onTap: _isRecording ? null : _recordSOSVideo,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(color: Colors.redAccent, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.redAccent.withOpacity(0.6),
                                  blurRadius: 30,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                            child: const Icon(Icons.videocam_rounded, size: 60, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (_isRecording)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        "Recording: $_recordSeconds s",
                        style: const TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildQuickTile("Contacts", Icons.contact_phone, () {}),
                      buildQuickTile("Community", Icons.groups, () {}),
                      buildQuickTile("News", Icons.newspaper, () {}),
                      buildQuickTile("History", Icons.history, () {}),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "📍 Location: $_location",
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
