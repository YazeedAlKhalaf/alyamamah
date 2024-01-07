import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/startup/startup_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class StartupView extends ConsumerStatefulWidget {
  const StartupView({super.key});

  @override
  ConsumerState<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends ConsumerState<StartupView> {
  @override
  void initState() {
    super.initState();

    ref.read(startupViewModelProvider).handleStartup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/logo/logo.png',
                height: 200,
              ),
            ),
            const SizedBox(height: Constants.padding * 3),
            const Center(child: CircularProgressIndicator()),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(999),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.padding,
                vertical: Constants.padding / 2,
              ),
              child: Text(
                context.s.made_with_love_by_yazeed_alkhalaf,
                style: context.textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: Constants.padding * 2),
          ],
        ),
      ),
    );
  }
}
