import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/services/yu_api/models/chat.dart';
import 'package:alyamamah/ui/views/yu_gpt/models/gpt_message_sender.dart';
import 'package:flutter/material.dart';

extension GptMessageSenderExtension on GptMessageSender {
  String mapToString(BuildContext context) {
    switch (this) {
      case GptMessageSender.human:
        return context.s.human;
      case GptMessageSender.ai:
        return context.s.ai;
    }
  }

  Color mapToColor(BuildContext context) {
    switch (this) {
      case GptMessageSender.human:
        return Theme.of(context).colorScheme.primary;
      case GptMessageSender.ai:
        return Theme.of(context).colorScheme.tertiary;
    }
  }

  ChatRole mapToChatRole() {
    switch (this) {
      case GptMessageSender.human:
        return ChatRole.human;
      case GptMessageSender.ai:
        return ChatRole.ai;
    }
  }
}
