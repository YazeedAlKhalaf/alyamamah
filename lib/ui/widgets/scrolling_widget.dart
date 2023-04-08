import 'package:flutter/material.dart';

class ScrollingWidget extends StatefulWidget {
  final List<Widget> children;
  final double spacing;

  const ScrollingWidget({
    required this.children,
    this.spacing = 30.0,
    Key? key,
  }) : super(key: key);

  @override
  State<ScrollingWidget> createState() => _ScrollingWidgetState();
}

class _ScrollingWidgetState extends State<ScrollingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Adjust loop duration
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ClipRect(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              double maxValue = constraints.maxWidth + widget.spacing;
              double currentAnimationValue =
                  _animationController.value * maxValue;
              return Transform.translate(
                offset: Offset(-currentAnimationValue, 0),
                child: child,
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...widget.children,
              ],
            ),
          ),
        );
      },
    );
  }
}
