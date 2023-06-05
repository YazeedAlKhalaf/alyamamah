import 'package:alyamamah/core/services/yu_api/models/chat.dart';
import 'package:alyamamah/ui/views/yu_gpt/models/gpt_message_sender.dart';

extension ChatRoleExtension on ChatRole {
  GptMessageSender mapToGptMessageSender() {
    switch (this) {
      case ChatRole.human:
        return GptMessageSender.human;
      case ChatRole.ai:
        return GptMessageSender.ai;
    }
  }
}
