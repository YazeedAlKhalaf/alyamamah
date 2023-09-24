import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

class YUDialog extends StatelessWidget {
  final String title;
  final String description;
  final String? noText;

  /// this method doesn't include the popping action.
  final void Function()? noOnPressed;
  final String? yesText;

  /// this method doesn't include the popping action.
  final void Function()? yesOnPressed;

  const YUDialog({
    super.key,
    required this.title,
    required this.description,
    this.noText,
    this.noOnPressed,
    this.yesText,
    this.yesOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
          onPressed: noOnPressed,
          child: Text(noText ?? context.s.no),
        ),
        TextButton(
          onPressed: yesOnPressed,
          child: Text(yesText ?? context.s.yes),
        ),
      ],
    );
  }
}
