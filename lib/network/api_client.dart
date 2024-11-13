import 'package:hackathon_sample/network/entity/chat_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'entity/chat_request.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.openai.com')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('/v1/chat/completions')
  Future<ChatResponse> postUserPrompt(
      @Header('Authorization') String authorization,
      @Body() ChatRequest request);
}
