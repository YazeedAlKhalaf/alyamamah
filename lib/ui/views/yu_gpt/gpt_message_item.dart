import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/gpt_message_sender.dart';
import 'package:alyamamah/ui/views/yu_gpt/models/gpt_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart' as intl;

class GptMessageItem extends StatelessWidget {
  final GptMessage message;

  const GptMessageItem({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: message.sender.mapToColor(context),
        ),
        const SizedBox(width: Constants.spacing),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.sender.mapToString(context).toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (message.message.isNotEmpty)
                SelectableText(
                  message.message,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textDirection:
                      intl.Bidi.detectRtlDirectionality(message.message)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                )
              else
                CircleAvatar(
                  radius: 6,
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                ).animate(
                  onPlay: (controller) {
                    controller.repeat(reverse: true);
                  },
                ).fade(duration: .5.seconds),
            ],
          ),
        ),
      ],
    );
  }
}
