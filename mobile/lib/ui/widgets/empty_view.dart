import 'package:alyamamah/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EmptyView extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? action;
  final Future<void> Function()? onRefresh;

  const EmptyView({
    super.key,
    required this.title,
    required this.subtitle,
    this.action,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final result = ListView(
      children: [
        Image.asset(
          'assets/images/man-searching-for-something.png',
          height: 220,
        )
            .animate(
              onComplete: (controller) => controller.loop(
                reverse: true,
              ),
            )
            .slide(
              duration: 3.seconds,
              begin: const Offset(0, 0.1),
              end: const Offset(0, 0),
              curve: Curves.easeInOut,
            ),
        const SizedBox(height: Constants.padding * 2),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Constants.spacing),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Constants.padding),
        if (action != null)
          Padding(
            padding: const EdgeInsets.only(bottom: Constants.padding),
            child: action!,
          ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
      child: onRefresh == null
          ? result
          : RefreshIndicator(
              onRefresh: onRefresh!,
              child: result,
            ),
    );
  }
}
