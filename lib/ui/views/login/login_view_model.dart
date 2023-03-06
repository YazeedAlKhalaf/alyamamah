import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final loginViewModelProvider = ChangeNotifierProvider(
  (ref) {
    return LoginViewModel(
      apiService: ref.read(apiServiceProvider),
      sharedPrefsService: ref.read(sharedPrefsServiceProvider),
      yuRouter: ref.read(yuRouterProvider),
      actorDetailsNotifier: ref.watch(actorDetailsProvider.notifier),
    );
  },
);

class LoginViewModel extends ChangeNotifier {
  final _log = Logger('LoginViewModel');

  final ApiService _apiService;
  final SharedPrefsService _sharedPrefsService;
  final YURouter _yuRouter;
  final ActorDetailsNotifier _actorDetailsNotifier;

  LoginViewModel({
    required ApiService apiService,
    required SharedPrefsService sharedPrefsService,
    required YURouter yuRouter,
    required ActorDetailsNotifier actorDetailsNotifier,
  })  : _apiService = apiService,
        _sharedPrefsService = sharedPrefsService,
        _yuRouter = yuRouter,
        _actorDetailsNotifier = actorDetailsNotifier;

  ApiServiceExceptionType? _apiServiceExceptionType;
  ApiServiceExceptionType? get apiServiceExceptionType =>
      _apiServiceExceptionType;

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
    _apiServiceExceptionType = null;
    _isBusy = true;
    notifyListeners();

    try {
      await _apiService.login(
        username: username,
        password: password,
      );

      final locale = _sharedPrefsService.getLocale();
      final changeLanguageLocale = Locale(
        locale ?? 'en',
      ).mapToChangeLanguageLocale();
      _log.info(
        'changing the language on the server to ${changeLanguageLocale.name}',
      );
      await _apiService.changeLanguage(
        changeLanguageLocale: changeLanguageLocale,
      );

      final actorDetails = await _apiService.login(
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
    } on ApiServiceException catch (e) {
      _log.severe('login | ApiServiceException with type: ${e.type}.');

      _apiServiceExceptionType = e.type;
      notifyListeners();
    }

    _isBusy = false;
    notifyListeners();
  }
}
