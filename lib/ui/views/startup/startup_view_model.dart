import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final startupViewModelProvider = ChangeNotifierProvider<StartupViewModel>(
  (ref) => StartupViewModel(
    authenticationService: ref.read(authenticationServiceProvider),
    yuRouter: ref.read(yuRouterProvider),
  ),
);

class StartupViewModel extends ChangeNotifier {
  final AuthenticationService _authenticationService;
  final YURouter _yuRouter;

  StartupViewModel({
    required AuthenticationService authenticationService,
    required YURouter yuRouter,
  })  : _authenticationService = authenticationService,
        _yuRouter = yuRouter;

  Future<void> handleStartup() async {
    await Future.delayed(const Duration(seconds: 2));

    // TODO(yazeedalkhalaf): check if user should go to home screen if logged in.
    await _yuRouter.pushAndPopUntil(
      const LoginRoute(),
      predicate: (_) => false,
    );
  }
}
