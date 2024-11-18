import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_sample/network/entity/chat_request.dart';
import 'package:hackathon_sample/providers/state/image_state.dart';
import 'package:image_picker/image_picker.dart';

import '../repository/api_repository.dart';

class ImageInputProvider extends StateNotifier<ImageState> {
  late ApiRepository? repository;
  ImageInputProvider(this.repository) : super(ImageState());

  final ImagePicker picker = ImagePicker();

  Future<void> loadGalleryImage() async {
    await picker.pickImage(source: ImageSource.gallery).then((image) {
      if (image != null) state = state.copyWith(image: image);
    });
  }

  Future<void> postImage() async {
    if (state.image != null) {
      state = state.copyWith(resultText: const AsyncValue.loading());
      try {
        Uint8List imageBytes = await state.image!.readAsBytes();
        String base64Image = base64.encode(imageBytes);
        final request = _createRequest(base64Image);
        final response = await repository?.postUserPrompt(request);
        if (response != null) {
          state = state.copyWith(
              resultText: AsyncValue.data(response.choices[0].message.content));
        }
      } catch (e, stackTrace) {
        state = state.copyWith(resultText: AsyncValue.error(e, stackTrace));
      }
    }
  }

  ChatRequest _createRequest(String base64Image) {
    return ChatRequest(model: 'gpt-4o', messages: [
      RequestMessage(role: 'system', content: 'You are a helpful assistant.'),
      RequestMessage(role: 'user', content: [
        Content(
            type: 'text',
            text:
                'How should I organize the foods in the following image to improve the freshness of the food in the refrigerator?'),
        Content(
            type: 'image_url',
            imageUrl: ImageUrl(url: 'data:image/jpeg;base64,$base64Image'))
      ])
    ]);
  }
}

final imageInputProvider =
    StateNotifierProvider<ImageInputProvider, ImageState>((ref) {
  return ImageInputProvider(ApiRepositoryImpl());
});
