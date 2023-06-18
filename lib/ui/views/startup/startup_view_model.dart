import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/extensions/string.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/providers/feature_flags/feature_flags_state_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/connectivity/connectivity_service.dart';
import 'package:alyamamah/core/services/firebase_messaging/firebase_messaging_service.dart';
import 'package:alyamamah/core/services/permission_handler/permission_handler_service.dart';
import 'package:alyamamah/core/services/rev_cat/rev_cat_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';

final startupViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => StartupViewModel(
    apiService: ref.read(apiServiceProvider),
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    yuRouter: ref.read(yuRouterProvider),
    actorDetailsNotifier: ref.read(actorDetailsProvider.notifier),
    revCatService: ref.read(revCatServiceProvider),
    yuApiService: ref.read(yuApiServiceProvider),
    connectivityService: ref.read(connectivityServiceProvider.notifier),
    firebaseMessagingService: ref.read(firebaseMessagingServiceProvider),
    featureFlagsStateNotifier:
        ref.read(featureFlagsStateNotifierProvider.notifier),
    permissionHandlerService: ref.read(permissionHandlerServiceProvider),
  ),
);

class StartupViewModel extends ChangeNotifier {
  final _log = Logger('StartupViewModel');

  final ApiService _apiService;
  final SharedPrefsService _sharedPrefsService;
  final YURouter _yuRouter;
  final ActorDetailsNotifier _actorDetailsNotifier;
  final RevCatService _revCatService;
  final YuApiService _yuApiService;
  final ConnectivityService _connectivityService;
  final FirebaseMessagingService _firebaseMessagingService;
  final FeatureFlagsStateNotifier _featureFlagsStateNotifier;
  final PermissionHandlerService _permissionHandlerService;

  StartupViewModel({
    required ApiService apiService,
    required SharedPrefsService sharedPrefsService,
    required YURouter yuRouter,
    required ActorDetailsNotifier actorDetailsNotifier,
    required RevCatService revCatService,
    required YuApiService yuApiService,
    required ConnectivityService connectivityService,
    required FirebaseMessagingService firebaseMessagingService,
    required FeatureFlagsStateNotifier featureFlagsStateNotifier,
    required PermissionHandlerService permissionHandlerService,
  })  : _apiService = apiService,
        _sharedPrefsService = sharedPrefsService,
        _yuRouter = yuRouter,
        _actorDetailsNotifier = actorDetailsNotifier,
        _revCatService = revCatService,
        _yuApiService = yuApiService,
        _connectivityService = connectivityService,
        _firebaseMessagingService = firebaseMessagingService,
        _featureFlagsStateNotifier = featureFlagsStateNotifier,
        _permissionHandlerService = permissionHandlerService;

  Future<void> handleStartup() async {
    // This is a hack, for some reason if the screen does not appear it breaks the app.
    // Error: FlutterError (setState() or markNeedsBuild() called during build.
    await Future.delayed(const Duration(milliseconds: 300));

    await _revCatService.initPlatformState();

    final username = _sharedPrefsService.getUsername();
    final password = _sharedPrefsService.getPassword();
    final accessToken = _sharedPrefsService.getAccessToken();

    if (username != null && password != null) {
      _log.fine(
        'handleStartup | username and password are not null, logging in automatically.',
      );

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

        await _revCatService.logIn(username);

        if (accessToken == null || accessToken.isJwtExpired()) {
          _log.fine(
            'handleStartup | accessToken is null, getting a new one.',
          );

          final fcmToken = await _firebaseMessagingService.getToken();
          final accessToken = await _yuApiService.login(
            username: username,
            password: password,
            fcmToken: fcmToken ?? '',
          );
          await _sharedPrefsService.saveAccessToken(accessToken: accessToken);
        }

        await _featureFlagsStateNotifier.init(userId: username);

        final notificationPermissionStatus =
            await _permissionHandlerService.checkNotificationPermissionStatus();

        _log.fine(
          'handleStartup | succeeded in logging in, going to main route.',
        );

        // this is a hack for the weird navigator dirty assertion.
        await Future.delayed(const Duration(milliseconds: 50));
        _yuRouter.pushAndPopUntil(
          MainRoute(),
          predicate: (_) => false,
        );

        // wait a bit for the user to understand what is going on.
        await Future.delayed(const Duration(milliseconds: 1500));

        if (notificationPermissionStatus.isDenied) {
          _log.fine(
            'handleStartup | succeeded in logging in and went to main route, but showing notification permission view first.',
          );

          await _yuRouter.push(NotificationsPermissionRoute());
        }
      } on ApiServiceException catch (e) {
        _log.severe(
          'handleStartup | caught ApiServiceException logging in automatically: ${e.type}.',
        );

        _connectivityService.setConnected(false);
        await _yuRouter.pushAndPopUntil(
          MainRoute(),
          predicate: (_) => false,
        );
      } on YuApiServiceException catch (e) {
        _log.severe(
          'handleStartup | caught YuApiServiceException logging in automatically: ${e.type}.',
        );

        _connectivityService.setConnected(false);
        await _yuRouter.pushAndPopUntil(
          MainRoute(),
          predicate: (_) => false,
        );
      }
    } else {
      _log.severe(
        'handleStartup | username and password are null, going to onboarding route.',
      );

      await _yuRouter.pushAndPopUntil(
        const OnboardingRoute(),
        predicate: (_) => false,
      );
    }
  }
}
