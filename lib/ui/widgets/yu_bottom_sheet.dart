import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

class YUBottomSheet extends StatelessWidget {
  final String? title;
  final String? description;
  final List<Widget> children;
  final bool areChildrenExpanded;

  const YUBottomSheet({
    super.key,
    this.title,
    this.description,
    required this.children,
    this.areChildrenExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final result = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.padding * 1.5,
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(Constants.padding),
        child: Column(
          children: [
            ...children,
          ],
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        top: false,
        right: false,
        left: false,
        bottom: true,
        minimum: const EdgeInsets.only(bottom: Constants.padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Constants.spacing),
            ],
            if (description != null) ...[
              Padding(
                padding: const EdgeInsets.only(
                  left: Constants.padding,
                  right: Constants.padding,
                  bottom: Constants.padding,
                ),
                child: Text(
                  description!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.outline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            if (areChildrenExpanded) Expanded(child: result) else result
          ],
        ),
      ),
    );
  }
}
