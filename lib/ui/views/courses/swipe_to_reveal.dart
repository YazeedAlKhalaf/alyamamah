import 'package:flutter/material.dart';

class SwipeToReveal extends StatefulWidget {
  final Widget child;

  const SwipeToReveal({required this.child, Key? key}) : super(key: key);

  @override
  State<SwipeToReveal> createState() => _SwipeToRevealState();
}

class _SwipeToRevealState extends State<SwipeToReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  double _dragOffset = 0;
  final double _elasticFactor = 0.3;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0, end: 0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragUpdate(PointerMoveEvent details) {
    final textDirection = Directionality.of(context);

    setState(() {
      double delta = textDirection == TextDirection.ltr
          ? details.delta.dx
          : -details.delta.dx;

      if (_dragOffset + delta < 0) {
        delta *= _elasticFactor;
      }

      _dragOffset += delta;
    });
  }

  void _handleDragEnd(PointerUpEvent details) {
    if (_dragOffset > 0) {
      setState(() {
        _animation = Tween<double>(begin: _dragOffset, end: 0).animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));
      });
      _animationController.forward(from: 0);
    }
    _dragOffset = 0;
  }

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);

    return Listener(
      onPointerMove: _handleDragUpdate,
      onPointerUp: _handleDragEnd,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              textDirection == TextDirection.ltr
                  ? _animation.value + _dragOffset
                  : -(_animation.value + _dragOffset),
              0,
            ),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
