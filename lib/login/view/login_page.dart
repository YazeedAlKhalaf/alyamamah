import 'package:alyamamah/login/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.read(loginProvider.notifier);
    final loginState = ref.watch(loginProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              Row(),
              const SizedBox(height: 24),
              Image.asset(
                "assets/images/yamamah-logo.png",
                width: 150,
              ),
              Text(
                "Login",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 24),
              TextField(
                onChanged: loginNotifier.setUsername,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Username',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                obscureText: true,
                onChanged: loginNotifier.setPassword,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Password',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              CheckboxListTile(
                value: loginState.rememberMe,
                onChanged: loginNotifier.setRememberMe,
                title: const Text("Remember me"),
              ),
              const SizedBox(height: 24),
              if (loginState.isLoading)
                const Center(child: CircularProgressIndicator()),
              if (!loginState.isLoading)
                ElevatedButton(
                  onPressed: () async {
                    await loginNotifier.login();
                  },
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              const SizedBox(height: 24),
              if (loginState.error != null)
                Text(
                  loginState.error!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
