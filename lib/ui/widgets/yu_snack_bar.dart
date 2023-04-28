import 'package:alyamamah/core/constants.dart';
import 'package:flutter/material.dart';

class YUSnackBar {
  static void show(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.spacing),
        ),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }
}
