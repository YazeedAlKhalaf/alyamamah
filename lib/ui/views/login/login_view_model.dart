import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/providers/feature_flags/feature_flags_state_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/connecty_cube/connecty_cube_service.dart';
import 'package:alyamamah/core/services/connecty_cube/connecty_cube_service_exception.dart';
import 'package:alyamamah/core/services/firebase_messaging/firebase_messaging_service.dart';
import 'package:alyamamah/core/services/rev_cat/rev_cat_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
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
      revCatService: ref.read(revCatServiceProvider),
      yuApiService: ref.read(yuApiServiceProvider),
      firebaseMessagingService: ref.read(firebaseMessagingServiceProvider),
      featureFlagsStateNotifier:
          ref.read(featureFlagsStateNotifierProvider.notifier),
      connectyCubeService: ref.read(connectyCubeServiceProvider),
    );
  },
);

class LoginViewModel extends ChangeNotifier {
  final _log = Logger('LoginViewModel');

  final ApiService _apiService;
  final SharedPrefsService _sharedPrefsService;
  final YURouter _yuRouter;
  final ActorDetailsNotifier _actorDetailsNotifier;
  final RevCatService _revCatService;
  final YuApiService _yuApiService;
  final FirebaseMessagingService _firebaseMessagingService;
  final FeatureFlagsStateNotifier _featureFlagsStateNotifier;
  final ConnectyCubeService _connectyCubeService;

  LoginViewModel({
    required ApiService apiService,
    required SharedPrefsService sharedPrefsService,
    required YURouter yuRouter,
    required ActorDetailsNotifier actorDetailsNotifier,
    required RevCatService revCatService,
    required YuApiService yuApiService,
    required FirebaseMessagingService firebaseMessagingService,
    required FeatureFlagsStateNotifier featureFlagsStateNotifier,
    required ConnectyCubeService connectyCubeService,
  })  : _apiService = apiService,
        _sharedPrefsService = sharedPrefsService,
        _yuRouter = yuRouter,
        _actorDetailsNotifier = actorDetailsNotifier,
        _revCatService = revCatService,
        _yuApiService = yuApiService,
        _firebaseMessagingService = firebaseMessagingService,
        _featureFlagsStateNotifier = featureFlagsStateNotifier,
        _connectyCubeService = connectyCubeService;

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  AutovalidateMode get autoValidateMode => _autoValidateMode;
  void setAutoValidateMode(AutovalidateMode value) {
    _autoValidateMode = value;
    notifyListeners();
  }

  ApiServiceExceptionType? _apiServiceExceptionType;
  ApiServiceExceptionType? get apiServiceExceptionType =>
      _apiServiceExceptionType;

  YuApiServiceExceptionType? _yuApiServiceExceptionType;
  YuApiServiceExceptionType? get yuApiServiceExceptionType =>
      _yuApiServiceExceptionType;

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

      Future(() async {
        await _revCatService.initPlatformState();
        await _revCatService.logIn(username);

        await _featureFlagsStateNotifier.init(userId: username);

        await _sharedPrefsService.saveUsernameAndPassword(
          username: username,
          password: password,
        );

        final fcmToken = await _firebaseMessagingService.getToken();
        final loginResponse = await _yuApiService.login(
          username: username,
          password: password,
          fcmToken: fcmToken ?? '',
        );
        await _sharedPrefsService.saveAccessToken(
          accessToken: loginResponse.accessToken,
        );
        await _sharedPrefsService.saveConnectyCubeToken(
          connectyCubeToken: loginResponse.connectyCubeToken,
        );

        final newConnectyCubeToken = _sharedPrefsService.getConnectyCubeToken();
        if (newConnectyCubeToken != null) {
          await _connectyCubeService.login(
            accessToken: newConnectyCubeToken,
          );
        }

        _log.fine('login | finished the background tasks.');
      });

      await _yuRouter.pushAndPopUntil(
        MainRoute(),
        predicate: (_) => false,
      );
    } on ApiServiceException catch (e) {
      _log.severe('login | ApiServiceException with type: ${e.type}.');

      _apiServiceExceptionType = e.type;
      notifyListeners();
    } on YuApiServiceException catch (e) {
      _log.severe('login | YuApiService with type: ${e.type}.');

      _yuApiServiceExceptionType = e.type;
      notifyListeners();
    } on ConnectyCubeServiceException {
      _log.severe('login | ConnectyCubeServiceException.');

      _yuApiServiceExceptionType = YuApiServiceExceptionType.unknown;
      notifyListeners();
    } catch (e) {
      _log.severe('login | Unknown error: $e.');

      _yuApiServiceExceptionType = YuApiServiceExceptionType.unknown;
      notifyListeners();
    }

    _isBusy = false;
    notifyListeners();
  }
}
