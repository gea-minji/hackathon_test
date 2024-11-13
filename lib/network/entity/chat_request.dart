class ChatRequest {
  final String model;
  final List<RequestMessage> messages;

  ChatRequest({
    required this.model,
    required this.messages,
  });

  factory ChatRequest.fromJson(Map<String, dynamic> json) {
    return ChatRequest(
      model: json['model'],
      messages: (json['messages'] as List)
          .map((e) => RequestMessage.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'messages': messages.map((e) => e.toJson()).toList(),
    };
  }
}

class RequestMessage {
  final String role;
  final String content;

  RequestMessage({
    required this.role,
    required this.content,
  });

  factory RequestMessage.fromJson(Map<String, dynamic> json) {
    return RequestMessage(
      role: json['role'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
    };
  }
}
