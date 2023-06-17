import 'package:alyamamah/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YUBottomSheet extends ConsumerStatefulWidget {
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
  ConsumerState<YUBottomSheet> createState() => _YUBottomSheetState();
}

class _YUBottomSheetState extends ConsumerState<YUBottomSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = BottomSheet.createAnimationController(this);
  }

  @override
  Widget build(BuildContext context) {
    final result = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.padding * 1.5,
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(Constants.padding),
        child: Column(
          children: [
            ...widget.children,
          ],
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: BottomSheet(
        onClosing: () {},
        animationController: animationController,
        builder: (BuildContext context) {
          return SafeArea(
            top: false,
            right: false,
            left: false,
            bottom: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.title != null) ...[
                  Text(
                    widget.title!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: Constants.spacing),
                ],
                if (widget.description != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Constants.padding,
                      right: Constants.padding,
                      bottom: Constants.padding,
                    ),
                    child: Text(
                      widget.description!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                if (widget.areChildrenExpanded)
                  Expanded(child: result)
                else
                  result
              ],
            ),
          );
        },
      ),
    );
  }
}
