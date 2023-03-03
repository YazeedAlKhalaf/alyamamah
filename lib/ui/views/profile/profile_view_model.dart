import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/auth/auth_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final profileViewModelProvider = ChangeNotifierProvider(
  (ref) => ProfileViewModel(
    yuRouter: ref.read(yuRouterProvider),
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    actorDetailsNotifier: ref.read(actorDetailsProvider.notifier),
    authService: ref.read(authServiceProvider),
  ),
);

class ProfileViewModel extends ChangeNotifier {
  final _log = Logger('ProfileViewModel');

  final YURouter _yuRouter;
  final SharedPrefsService _sharedPrefsService;
  final ActorDetailsNotifier _actorDetailsNotifier;
  final AuthService _authService;

  ProfileViewModel({
    required YURouter yuRouter,
    required SharedPrefsService sharedPrefsService,
    required ActorDetailsNotifier actorDetailsNotifier,
    required AuthService authService,
  })  : _yuRouter = yuRouter,
        _sharedPrefsService = sharedPrefsService,
        _actorDetailsNotifier = actorDetailsNotifier,
        _authService = authService;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  Future<void> navigateToStudentInfo() async {
    await _yuRouter.push(const StudentInfoRoute());
  }

  Future<void> logout() async {
    _log.info('logout | Logging out.');
    _isBusy = true;
    notifyListeners();

    await _sharedPrefsService.deleteUsernameAndPassword();
    await _authService.logout();
    _actorDetailsNotifier.setActorDetails(null);

    await _yuRouter.pushAndPopUntil(
      const LoginRoute(),
      predicate: (_) => false,
    );
    _isBusy = false;
    notifyListeners();
  }
}
