import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CameraService {
  CameraController? controller;

  Future<void> initialize() async {
    final cameras = await availableCameras();
    final camera = cameras.firstWhere(
      (cam) => cam.lensDirection == CameraLensDirection.back,
      orElse: () => cameras.first,
    );

    controller = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: true,
    );

    await controller?.initialize();
  }

  Future<XFile> recordVideo({int seconds = 5}) async {
    if (controller == null || !controller!.value.isInitialized) {
      throw Exception("Camera is not initialized.");
    }

    await controller!.prepareForVideoRecording();
    await controller!.startVideoRecording();

    await Future.delayed(Duration(seconds: seconds));

    return await controller!.stopVideoRecording();
  }

  void dispose() {
    controller?.dispose();
  }
}
