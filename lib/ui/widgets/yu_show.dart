import 'package:flutter/material.dart';

class YUShow {
  static Future<T?> modalBottomSheet<T>({
    required BuildContext context,
    bool isScrollControlled = false,
    required Widget Function(BuildContext) builder,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      enableDrag: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: builder,
    );
  }
}
