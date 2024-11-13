import '../network/api_provider.dart';
import '../network/entity/chat_request.dart';
import '../network/entity/chat_response.dart';

abstract class ApiRepository {
  Future<ChatResponse> postUserPrompt(ChatRequest request);
}

class ApiRepositoryImpl implements ApiRepository {
  @override
  Future<ChatResponse> postUserPrompt(ChatRequest request) async {
    final response = await ApiProvider().sendUserPrompt(request);
    return response;
  }
}
