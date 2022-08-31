import 'package:alyamamah/app/provider/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationNotifier = ref.read(authenticationProvider.notifier);

    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () async {
            await authenticationNotifier.logout();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
