import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/auth/auth_service.dart';
import 'package:alyamamah/core/services/auth/auth_service_exception.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final loginViewModelProvider = ChangeNotifierProvider(
  (ref) {
    return LoginViewModel(
      authService: ref.read(authServiceProvider),
      sharedPrefsService: ref.read(sharedPrefsServiceProvider),
      yuRouter: ref.read(yuRouterProvider),
      actorDetailsNotifier: ref.watch(actorDetailsProvider.notifier),
    );
  },
);

class LoginViewModel extends ChangeNotifier {
  final _log = Logger('LoginViewModel');

  final AuthService _authService;
  final SharedPrefsService _sharedPrefsService;
  final YURouter _yuRouter;
  final ActorDetailsNotifier _actorDetailsNotifier;

  LoginViewModel({
    required AuthService authService,
    required SharedPrefsService sharedPrefsService,
    required YURouter yuRouter,
    required ActorDetailsNotifier actorDetailsNotifier,
  })  : _authService = authService,
        _sharedPrefsService = sharedPrefsService,
        _yuRouter = yuRouter,
        _actorDetailsNotifier = actorDetailsNotifier;

  AuthServiceExceptionType? _authServiceExceptionType;
  AuthServiceExceptionType? get authServiceExceptionType =>
      _authServiceExceptionType;

  String _username = '';
  String get username => _username;

  void onUsernameChanged(String value) {
    _username = value;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;

  void onPasswordChanged(String value) {
    _password = value;
    notifyListeners();
  }

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  void toggleShowPassword() {
    _showPassword = !showPassword;
    notifyListeners();
  }

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  Future<void> login() async {
    _authServiceExceptionType = null;
    _isBusy = true;
    notifyListeners();

    try {
      final actorDetails = await _authService.login(
        username: username,
        password: password,
      );

      _actorDetailsNotifier.setActorDetails(actorDetails);

      await _sharedPrefsService.saveUsernameAndPassword(
        username: username,
        password: password,
      );

      await _yuRouter.pushAndPopUntil(
        MainRoute(),
        predicate: (_) => false,
      );
    } on AuthServiceException catch (e) {
      _log.severe('login | AuthServiceException with type: ${e.type}.');

      _authServiceExceptionType = e.type;
      notifyListeners();
    }

    _isBusy = false;
    notifyListeners();
  }
}
