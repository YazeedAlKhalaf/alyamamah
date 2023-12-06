import 'package:flutter/material.dart';

class AnimatedVisibility extends StatelessWidget {
  final Duration? duration;
  final bool visible;
  final Widget child;

  const AnimatedVisibility({
    super.key,
    this.duration,
    required this.visible,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration ?? const Duration(milliseconds: 200),
      child: visible ? child : const SizedBox.shrink(),
    );
  }
}
