import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

class OfferedCourseHoursCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;

  const OfferedCourseHoursCard({
    super.key,
    required this.text,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.padding / 4,
        vertical: Constants.padding / 2,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.textTheme.bodySmall?.copyWith(
          color: textColor ?? context.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
