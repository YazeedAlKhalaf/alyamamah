import 'package:alyamamah/app/provider/authentication_provider.dart';
import 'package:alyamamah/app/view/toggle_locale_button.dart';
import 'package:alyamamah/l10n/l10n.dart';
import 'package:alyamamah/login/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.read(authenticationProvider);
    final loginNotifier = ref.read(loginProvider.notifier);
    final loginState = ref.watch(loginProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  ToggleLocaleButton(),
                ],
              ),
              const SizedBox(height: 24),
              Image.asset(
                "assets/images/yamamah-logo.png",
                width: 250,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 24),
              Row(
                children: <Widget>[
                  Text(
                    context.l10n.login,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextFormField(
                initialValue: authenticationState.username,
                onChanged: loginNotifier.setUsername,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_rounded),
                  border: const UnderlineInputBorder(),
                  labelText: context.l10n.username,
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                initialValue: authenticationState.password,
                obscureText: !loginState.showPassword,
                onChanged: loginNotifier.setPassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_rounded),
                  suffixIcon: IconButton(
                    onPressed: loginNotifier.toggleShowPassword,
                    icon: loginState.showPassword
                        ? const Icon(Icons.visibility_off_rounded)
                        : const Icon(Icons.visibility_rounded),
                  ),
                  border: const UnderlineInputBorder(),
                  labelText: context.l10n.password,
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  loginNotifier.setRememberMe(!loginState.rememberMe);
                },
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: loginState.rememberMe,
                      onChanged: loginNotifier.setRememberMe,
                    ),
                    Text(
                      context.l10n.remember_me,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              if (loginState.isLoading)
                const Center(child: CircularProgressIndicator()),
              if (!loginState.isLoading)
                FilledButton(
                  onPressed: () async {
                    await loginNotifier.login(
                      onSuccess: () async {
                        final authenticationNotifier = ref.read(
                          authenticationProvider.notifier,
                        );
                        await authenticationNotifier.updateAuthenticationState(
                          isLoggedIn: true,
                        );
                      },
                    );
                  },
                  child: Text(context.l10n.login),
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
