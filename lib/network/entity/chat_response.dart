class ChatResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Choice> choices;
  final Usage usage;
  final dynamic systemFingerprint;

  ChatResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
    this.systemFingerprint,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      id: json['id'],
      object: json['object'],
      created: json['created'],
      model: json['model'],
      choices:
          (json['choices'] as List).map((e) => Choice.fromJson(e)).toList(),
      usage: Usage.fromJson(json['usage']),
      systemFingerprint: json['system_fingerprint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'model': model,
      'choices': choices.map((e) => e.toJson()).toList(),
      'usage': usage.toJson(),
      'system_fingerprint': systemFingerprint,
    };
  }
}

class Choice {
  final int index;
  final ResponseMessage message;
  final dynamic logprobs;
  final String finishReason;

  Choice({
    required this.index,
    required this.message,
    this.logprobs,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      index: json['index'],
      message: ResponseMessage.fromJson(json['message']),
      logprobs: json['logprobs'],
      finishReason: json['finish_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'message': message.toJson(),
      'logprobs': logprobs,
      'finish_reason': finishReason,
    };
  }
}

class ResponseMessage {
  final String role;
  final String content;
  final dynamic refusal;

  ResponseMessage({
    required this.role,
    required this.content,
    this.refusal,
  });

  factory ResponseMessage.fromJson(Map<String, dynamic> json) {
    return ResponseMessage(
      role: json['role'],
      content: json['content'],
      refusal: json['refusal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
      'refusal': refusal,
    };
  }
}

class Usage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;
  final TokenDetails? promptTokensDetails;
  final TokenDetails? completionTokensDetails;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
    this.promptTokensDetails,
    this.completionTokensDetails,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      promptTokens: json['prompt_tokens'],
      completionTokens: json['completion_tokens'],
      totalTokens: json['total_tokens'],
      promptTokensDetails: json['prompt_tokens_details'] != null
          ? TokenDetails.fromJson(json['prompt_tokens_details'])
          : null,
      completionTokensDetails: json['completion_tokens_details'] != null
          ? TokenDetails.fromJson(json['completion_tokens_details'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prompt_tokens': promptTokens,
      'completion_tokens': completionTokens,
      'total_tokens': totalTokens,
      'prompt_tokens_details': promptTokensDetails?.toJson(),
      'completion_tokens_details': completionTokensDetails?.toJson(),
    };
  }
}

class TokenDetails {
  final int? cachedTokens;
  final int audioTokens;
  final int? reasoningTokens;
  final int? acceptedPredictionTokens;
  final int? rejectedPredictionTokens;

  TokenDetails({
    required this.cachedTokens,
    required this.audioTokens,
    this.reasoningTokens,
    this.acceptedPredictionTokens,
    this.rejectedPredictionTokens,
  });

  factory TokenDetails.fromJson(Map<String, dynamic> json) {
    return TokenDetails(
      cachedTokens: json['cached_tokens'],
      audioTokens: json['audio_tokens'],
      reasoningTokens: json['reasoning_tokens'],
      acceptedPredictionTokens: json['accepted_prediction_tokens'],
      rejectedPredictionTokens: json['rejected_prediction_tokens'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cached_tokens': cachedTokens,
      'audio_tokens': audioTokens,
      'reasoning_tokens': reasoningTokens,
      'accepted_prediction_tokens': acceptedPredictionTokens,
      'rejected_prediction_tokens': rejectedPredictionTokens,
    };
  }
}
