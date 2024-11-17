import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_sample/network/entity/chat_request.dart';
import 'package:hackathon_sample/repository/api_repository.dart';

class AsyncChatNotifier extends AsyncNotifier<String?> {
  late ApiRepository? repository;
  AsyncChatNotifier(this.repository);

  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> postUserPrompt(String message) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final request = ChatRequest(model: 'gpt-3.5-turbo', messages: [
        RequestMessage(role: 'system', content: 'You are a helpful assistant.'),
        RequestMessage(role: 'user', content: message),
      ]);
      final response = await repository?.postUserPrompt(request);
      return response?.choices[0].message.content;
    });
  }
}

// final repositoryProvider =
//     Provider<ApiRepository>((ref) => ApiRepositoryImpl());

final asyncChatProvider = AsyncNotifierProvider<AsyncChatNotifier, String?>(() {
  return AsyncChatNotifier(ApiRepositoryImpl());
});
