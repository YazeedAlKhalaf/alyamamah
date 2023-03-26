import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/onboarding/onboarding_view_model.dart';
import 'package:alyamamah/ui/widgets/switch_language_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class OnboardingView extends ConsumerWidget {
  static final Key loginButtonKey = UniqueKey();

  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Constants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  SwitchLanguageButton(),
                ],
              ),
              const Spacer(),
              Text(
                context.s.welcome_to_alyamamah,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Expanded(
                flex: 20,
                child: Image.asset(
                  'assets/images/3d-business-man-and-woman-working-at-the-table.png',
                ),
              ),
              const Spacer(),
              FilledButton.tonal(
                key: loginButtonKey,
                onPressed: () async {
                  await ref
                      .read(onboardingViewModelProvider)
                      .navigateToLoginView();
                },
                child: Text(context.s.login),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
