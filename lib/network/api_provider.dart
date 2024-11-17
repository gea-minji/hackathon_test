import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'api_client.dart';
import 'entity/chat_request.dart';
import 'entity/chat_response.dart';

class ApiProvider {
  static const _tag = 'ApiProvider';
  late ApiClient _apiClient;

  ApiProvider() {
    final dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    _apiClient = ApiClient(dio);
  }

  Future<ChatResponse> sendUserPrompt(ChatRequest request) async {
    try {
      final response = await _apiClient.postUserPrompt(
          'Bearer ${dotenv.env['apiKey']}', request);
      return response;
    } catch (e) {
      log('$_tag $e');
      rethrow;
    }
  }
}
