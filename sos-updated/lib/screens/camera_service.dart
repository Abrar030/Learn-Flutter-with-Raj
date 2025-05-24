import 'package:camera/camera.dart';

class CameraService {
  CameraController? controller;

  Future<void> initialize() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    controller = CameraController(frontCamera, ResolutionPreset.medium);
    await controller!.initialize();
  }

  Future<XFile> recordVideo({int seconds = 5}) async {
    await controller!.startVideoRecording();
    await Future.delayed(Duration(seconds: seconds));
    return await controller!.stopVideoRecording();
  }

  void dispose() {
    controller?.dispose();
  }
}