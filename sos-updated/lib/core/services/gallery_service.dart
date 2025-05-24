import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';
import 'dart:io';

class GalleryService {
  Future<void> saveVideo(String path) async {
    final file = File(path);
    final Uint8List bytes = await file.readAsBytes();
    await ImageGallerySaver.saveFile(path, isReturnPathOfIOS: true);
  }
}
