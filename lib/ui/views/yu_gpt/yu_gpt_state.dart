import 'package:alyamamah/core/models/optional.dart';
import 'package:alyamamah/core/services/yu_api/models/model_name.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
import 'package:alyamamah/ui/views/yu_gpt/models/gpt_message.dart';

class YuGptState {
  final List<GptMessage> messages;
  final YuApiServiceExceptionType? errorType;
  final bool isGenerating;
  final ModelName modelName;

  YuGptState({
    this.messages = const [],
    this.errorType,
    this.isGenerating = false,
    this.modelName = ModelName.gpt3_5turbo,
  });

  YuGptState copyWith({
    List<GptMessage>? messages,
    Optional<YuApiServiceExceptionType>? errorType,
    bool? isGenerating,
    ModelName? modelName,
  }) {
    return YuGptState(
      messages: messages ?? this.messages,
      errorType: errorType == null ? this.errorType : errorType.value,
      isGenerating: isGenerating ?? this.isGenerating,
      modelName: modelName ?? this.modelName,
    );
  }
}
