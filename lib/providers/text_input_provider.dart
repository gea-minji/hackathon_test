import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_sample/network/entity/chat_request.dart';
import 'package:hackathon_sample/repository/api_repository.dart';

class TextInputProvider extends StateNotifier<AsyncValue<String?>> {
  late ApiRepository? repository;
  TextInputProvider(this.repository) : super(const AsyncValue.data(null));

  Future<void> postUserPrompt(String message) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final request = ChatRequest(model: 'gpt-4o', messages: [
        RequestMessage(role: 'system', content: 'You are a helpful assistant.'),
        RequestMessage(role: 'user', content: message),
      ]);
      final response = await repository?.postUserPrompt(request);
      return response?.choices[0].message.content;
    });
  }
}

final textInputProvider =
    StateNotifierProvider<TextInputProvider, AsyncValue<String?>>((ref) {
  final apiRepository = ref.read(apiRepositoryProvider);
  return TextInputProvider(apiRepository);
});
