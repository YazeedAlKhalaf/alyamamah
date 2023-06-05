import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/extensions/string.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/connectivity/connectivity_service.dart';
import 'package:alyamamah/core/services/rev_cat/rev_cat_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final startupViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => StartupViewModel(
    apiService: ref.read(apiServiceProvider),
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    yuRouter: ref.read(yuRouterProvider),
    actorDetailsNotifier: ref.read(actorDetailsProvider.notifier),
    revCatService: ref.read(revCatServiceProvider),
    yuApiService: ref.read(yuApiServiceProvider),
    connectivityService: ref.read(connectivityServiceProvider.notifier),
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

  StartupViewModel({
    required ApiService apiService,
    required SharedPrefsService sharedPrefsService,
    required YURouter yuRouter,
    required ActorDetailsNotifier actorDetailsNotifier,
    required RevCatService revCatService,
    required YuApiService yuApiService,
    required ConnectivityService connectivityService,
  })  : _apiService = apiService,
        _sharedPrefsService = sharedPrefsService,
        _yuRouter = yuRouter,
        _actorDetailsNotifier = actorDetailsNotifier,
        _revCatService = revCatService,
        _yuApiService = yuApiService,
        _connectivityService = connectivityService;

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

          final accessToken = await _yuApiService.login(
            username: username,
            password: password,
          );
          await _sharedPrefsService.saveAccessToken(accessToken: accessToken);
        }

        _log.fine(
          'handleStartup | succeeded in logging in, going to main route.',
        );

        // this is a hack for the weird navigator dirty assertion.
        await Future.delayed(const Duration(milliseconds: 50));

        await _yuRouter.pushAndPopUntil(
          MainRoute(),
          predicate: (_) => false,
        );
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
