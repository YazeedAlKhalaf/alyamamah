import 'package:alyamamah/app/provider/authentication_provider.dart';
import 'package:alyamamah/app/view/toggle_locale_button.dart';
import 'package:alyamamah/l10n/l10n.dart';
import 'package:alyamamah/login/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationNotifier = ref.read(authenticationProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  ToggleLocaleButton(),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () async {
                  await authenticationNotifier.logout();
                  ref.invalidate(loginProvider);
                  ref.invalidate(authenticationProvider);
                },
                child: Text(context.l10n.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
