import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

class BlockquoteText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const BlockquoteText(
    this.data, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(
      color: context.colorScheme.secondary,
      width: 4,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: context.isArabic ? BorderSide.none : borderSide,
          right: context.isArabic ? borderSide : BorderSide.none,
        ),
      ),
      padding: EdgeInsets.only(
        left: context.isArabic ? 0 : Constants.spacing,
        right: context.isArabic ? Constants.spacing : 0,
      ),
      child: Text(
        data,
        style: style,
      ),
    );
  }
}
