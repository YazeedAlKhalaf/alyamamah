import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/auth_service_exception_type.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/login/login_view_model.dart';
import 'package:alyamamah/ui/widgets/button_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  static final Key showPasswordButtonKey = UniqueKey();
  static final Key loginButtonKey = UniqueKey();

  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginViewModel = ref.watch(loginViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.login),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TODO(yazeedalkhalaf): add validation for username and password fields.
              TextFormField(
                initialValue: loginViewModel.username,
                onChanged: ref.read(loginViewModelProvider).onUsernameChanged,
                decoration: InputDecoration(
                  labelText: context.s.username,
                ),
              ),
              TextFormField(
                initialValue: loginViewModel.password,
                onChanged: ref.read(loginViewModelProvider).onPasswordChanged,
                decoration: InputDecoration(
                  labelText: context.s.password,
                  suffixIcon: IconButton(
                    key: showPasswordButtonKey,
                    onPressed: () {
                      ref.read(loginViewModelProvider).toggleShowPassword();
                    },
                    icon: loginViewModel.showPassword
                        ? const Icon(Icons.visibility_rounded)
                        : const Icon(Icons.visibility_off_rounded),
                  ),
                ),
                obscureText: !loginViewModel.showPassword,
              ),
              const SizedBox(height: Constants.padding),
              FilledButton.tonal(
                key: loginButtonKey,
                onPressed: () async {
                  await ref.read(loginViewModelProvider).login();
                },
                child: loginViewModel.isBusy
                    ? const ButtonLoading()
                    : Text(context.s.login),
              ),
              const SizedBox(height: Constants.padding),
              if (loginViewModel.authServiceExceptionType != null)
                Text(
                  loginViewModel.authServiceExceptionType!
                      .mapAuthServiceExceptionType(context),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
