import 'package:gallery_saver/gallery_saver.dart';

class GalleryService {
  Future<void> saveVideo(String path) async {
    await GallerySaver.saveVideo(path);
  }
}
