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
  final dynamic content; // Can be String or List<Content>

  RequestMessage({required this.role, required this.content});

  factory RequestMessage.fromJson(Map<String, dynamic> json) {
    return RequestMessage(
      role: json['role'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    if (content is String) {
      return {
        'role': role,
        'content': content,
      };
    } else if (content is List<Content>) {
      return {
        'role': role,
        'content': (content as List<Content>).map((c) => c.toJson()).toList(),
      };
    } else {
      throw Exception('Invalid content type');
    }
  }
}

// class RequestMessage {
//   final String role;
//   final String content;
//
//   RequestMessage({
//     required this.role,
//     required this.content,
//   });
//
//   factory RequestMessage.fromJson(Map<String, dynamic> json) {
//     return RequestMessage(
//       role: json['role'],
//       content: json['content'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'role': role,
//       'content': content,
//     };
//   }
// }

class Content {
  final String type;
  final String? text;
  final ImageUrl? imageUrl;

  Content({required this.type, this.text, this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      if (text != null) 'text': text,
      if (imageUrl != null) 'image_url': imageUrl?.toJson(),
    };
  }
}

class ImageUrl {
  final String url;

  ImageUrl({required this.url});

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}
