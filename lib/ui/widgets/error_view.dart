import 'package:alyamamah/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ErrorView extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? action;
  final Future<void> Function()? onRefresh;

  const ErrorView({
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
          'assets/images/man-sitting-on-rocks-alone.png',
          height: 350,
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
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Constants.spacing),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Constants.padding),
        if (action != null) action!,
      ],
    );

    return Padding(
      padding: const EdgeInsets.all(Constants.padding),
      child: onRefresh == null
          ? result
          : RefreshIndicator(
              onRefresh: onRefresh!,
              child: result,
            ),
    );
  }
}
