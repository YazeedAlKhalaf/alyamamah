import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/api_service_exception_type.dart';
import 'package:alyamamah/core/extensions/auth_repository_exception_type.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/login/login_view_model.dart';
import 'package:alyamamah/ui/widgets/button_loading.dart';
import 'package:alyamamah/ui/widgets/privacy_policy_and_terms_of_use_widget.dart';
import 'package:alyamamah/ui/widgets/switch_language_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginView extends ConsumerStatefulWidget {
  static final Key showPasswordButtonKey = UniqueKey();
  static final Key loginButtonKey = UniqueKey();

  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = ref.watch(loginViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.s.login,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
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
                Form(
                  key: loginForm,
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
                            return context.s.university_id_is_required;
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
                            key: LoginView.showPasswordButtonKey,
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
                            return context.s.password_is_required;
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Constants.padding),
                FilledButton.tonal(
                  key: LoginView.loginButtonKey,
                  onPressed: () async {
                    if (loginForm.currentState?.validate() == false) {
                      ref.read(loginViewModelProvider).setAutoValidateMode(
                            AutovalidateMode.onUserInteraction,
                          );
                    } else {
                      await ref.read(loginViewModelProvider).login();
                    }
                  },
                  child: loginViewModel.isBusy
                      ? const ButtonLoading()
                      : Text(context.s.login),
                ),
                if (loginViewModel.apiServiceExceptionType != null ||
                    loginViewModel.authRepositoryExceptionType != null) ...[
                  const SizedBox(height: Constants.padding),
                  Text(
                    loginViewModel.apiServiceExceptionType
                            ?.mapToString(context) ??
                        loginViewModel.authRepositoryExceptionType
                            ?.mapToString(context) ??
                        '',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: Constants.padding),
                const PrivacyPolicyAndTermsOfUseWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
