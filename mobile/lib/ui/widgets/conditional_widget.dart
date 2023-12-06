import 'package:flutter/material.dart';

class ConditionalWidget extends StatelessWidget {
  final bool condition;
  final Widget showTrue;
  final Widget showFalse;

  const ConditionalWidget({
    super.key,
    required this.condition,
    required this.showTrue,
    required this.showFalse,
  });

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return showTrue;
    }

    return showFalse;
  }
}
