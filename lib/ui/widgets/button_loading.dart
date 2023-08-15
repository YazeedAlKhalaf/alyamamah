import 'package:flutter/material.dart';

class ButtonLoading extends StatelessWidget {
  final Color? color;

  const ButtonLoading({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 25,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
    );
  }
}
