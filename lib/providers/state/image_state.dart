import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageState {
  final XFile? image;
  final AsyncValue<String?> resultText;

  ImageState({
    this.image,
    this.resultText = const AsyncValue.data(null),
  });

  ImageState copyWith({
    XFile? image,
    AsyncValue<String?>? resultText,
  }) {
    return ImageState(
      image: image ?? this.image,
      resultText: resultText ?? this.resultText,
    );
  }
}
