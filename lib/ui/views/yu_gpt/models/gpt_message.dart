import 'package:alyamamah/ui/views/yu_gpt/models/gpt_message_sender.dart';

class GptMessage {
  final GptMessageSender sender;
  final String message;

  const GptMessage({
    required this.sender,
    required this.message,
  });

  GptMessage copyWith({
    GptMessageSender? sender,
    String? message,
  }) {
    return GptMessage(
      sender: sender ?? this.sender,
      message: message ?? this.message,
    );
  }
}
