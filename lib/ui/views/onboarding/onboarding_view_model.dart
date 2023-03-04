import 'package:alyamamah/core/router/yu_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final onboardingViewModelProvider = ChangeNotifierProvider((ref) {
  return OnboardingViewModel(
    yuRouter: ref.read(yuRouterProvider),
  );
});

class OnboardingViewModel extends ChangeNotifier {
  final _log = Logger('OnboardingViewModel');

  final YURouter _yuRouter;

  OnboardingViewModel({
    required YURouter yuRouter,
  }) : _yuRouter = yuRouter;

  Future<void> navigateToLoginView() async {
    _log.fine('navigateToLoginView | navigating to login view.');
    await _yuRouter.push(
      const LoginRoute(),
    );
  }
}
