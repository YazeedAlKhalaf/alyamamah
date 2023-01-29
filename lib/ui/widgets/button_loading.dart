import 'package:flutter/material.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox.square(
        dimension: 30,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
