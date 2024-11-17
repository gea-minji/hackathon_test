import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputProvider extends StateNotifier<XFile?> {
  ImageInputProvider() : super(null);

  final ImagePicker picker = ImagePicker();

  Future<void> loadGalleryImage() async {
    await picker.pickImage(source: ImageSource.gallery).then((image) {
      if (image != null) state = image;
    });
  }
}

final imageInputProvider =
    StateNotifierProvider<ImageInputProvider, XFile?>((ref) {
  return ImageInputProvider();
});
