import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/ui/widgets/drag_handle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YUBottomSheet extends ConsumerStatefulWidget {
  final String? title;
  final List<Widget> children;

  const YUBottomSheet({
    super.key,
    this.title,
    required this.children,
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
    return BottomSheet(
      onClosing: () {},
      enableDrag: true,
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
              const SizedBox(height: Constants.spacing),
              const DragHandle(),
              const SizedBox(height: Constants.padding),
              if (widget.title != null)
                Text(
                  widget.title!,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              const SizedBox(height: Constants.padding),
              ...widget.children,
            ],
          ),
        );
      },
    );
  }
}