import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/firebase_messaging/firebase_messaging_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class NotificationsPermissionView extends ConsumerWidget {
  const NotificationsPermissionView({
    super.key,
    this.onPermissionGranted,
    this.onDismissed,
  });

  final void Function()? onPermissionGranted;

  /// Popping the route is always done, so don't duplicate that.
  final void Function()? onDismissed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.s.notifications,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.asset(
              'assets/images/boy-with-bell-in-his-hand.png',
              height: 350,
            )
                .animate(
                  onComplete: (controller) => controller.loop(
                    reverse: true,
                  ),
                )
                .scale(
                  duration: 3.seconds,
                  begin: const Offset(0.9, 0.9),
                  end: const Offset(1.1, 1.1),
                  curve: Curves.easeInOut,
                ),
            const SizedBox(height: Constants.padding),
            Text(
              context.s.unlock_a_world_of_instant_updates,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: Constants.spacing),
            Text(
              context.s
                  .dont_miss_a_beat_enable_notifications_we_promise_only_to_ping_when_its_worth_your_while,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Constants.padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: Constants.padding),
              FilledButton(
                onPressed: () async {
                  await ref
                      .read(firebaseMessagingServiceProvider)
                      .askPermission();

                  onPermissionGranted?.call();

                  ref.read(yuRouterProvider).pop();
                },
                child: Text(context.s.allow_notifications),
              ),
              const SizedBox(height: Constants.spacing),
              FilledButton.tonal(
                onPressed: () {
                  onDismissed?.call();

                  ref.read(yuRouterProvider).pop();
                },
                child: Text(context.s.skip_for_now),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
