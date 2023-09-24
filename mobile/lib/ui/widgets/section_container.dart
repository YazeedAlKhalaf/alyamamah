import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final List<Widget> children;
  final bool showTopPadding;

  const SectionContainer({
    super.key,
    required this.children,
    this.showTopPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(
        horizontal: Constants.padding,
      ),
      padding: showTopPadding
          ? const EdgeInsets.only(
              top: Constants.padding,
            )
          : null,
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
