import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/api_service_exception_type.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/login/login_view_model.dart';
import 'package:alyamamah/ui/widgets/button_loading.dart';
import 'package:alyamamah/ui/widgets/switch_language_button.dart';
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
        actions: const [
          SwitchLanguageButton(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/3d-flame-work-place-with-laptop-on-the-table-and-presentation-board-on-the-wall.png',
                  height: 250,
                ),
                Form(
                  key: loginViewModel.loginForm,
                  autovalidateMode: loginViewModel.autoValidateMode,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: loginViewModel.username,
                        onChanged:
                            ref.read(loginViewModelProvider).onUsernameChanged,
                        decoration: InputDecoration(
                          labelText: context.s.username,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'University ID is required';
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: loginViewModel.password,
                        onChanged:
                            ref.read(loginViewModelProvider).onPasswordChanged,
                        decoration: InputDecoration(
                          labelText: context.s.password,
                          suffixIcon: IconButton(
                            key: showPasswordButtonKey,
                            onPressed: () {
                              ref
                                  .read(loginViewModelProvider)
                                  .toggleShowPassword();
                            },
                            icon: loginViewModel.showPassword
                                ? const Icon(Icons.visibility_rounded)
                                : const Icon(Icons.visibility_off_rounded),
                          ),
                        ),
                        obscureText: !loginViewModel.showPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
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
                if (loginViewModel.apiServiceExceptionType != null)
                  Text(
                    loginViewModel.apiServiceExceptionType!
                        .mapApiServiceExceptionType(context),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
