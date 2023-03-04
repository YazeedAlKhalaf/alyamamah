import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final startupViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => StartupViewModel(
    apiService: ref.read(apiServiceProvider),
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    yuRouter: ref.read(yuRouterProvider),
    actorDetailsNotifier: ref.read(actorDetailsProvider.notifier),
  ),
);

class StartupViewModel extends ChangeNotifier {
  final _log = Logger('StartupViewModel');

  final ApiService _apiService;
  final SharedPrefsService _sharedPrefsService;
  final YURouter _yuRouter;
  final ActorDetailsNotifier _actorDetailsNotifier;

  StartupViewModel({
    required ApiService apiService,
    required SharedPrefsService sharedPrefsService,
    required YURouter yuRouter,
    required ActorDetailsNotifier actorDetailsNotifier,
  })  : _apiService = apiService,
        _sharedPrefsService = sharedPrefsService,
        _yuRouter = yuRouter,
        _actorDetailsNotifier = actorDetailsNotifier;

  Future<void> handleStartup() async {
    // This is a hack, for some reason if the screen does not appear it breaks the app.
    // Error: FlutterError (setState() or markNeedsBuild() called during build.
    await Future.delayed(const Duration(milliseconds: 300));

    final username = _sharedPrefsService.getUsername();
    final password = _sharedPrefsService.getPassword();

    if (username != null && password != null) {
      _log.fine(
        'handleStartup | username and password are not null, logging in automatically.',
      );

      try {
        final actorDetails = await _apiService.login(
          username: username,
          password: password,
        );

        _actorDetailsNotifier.setActorDetails(actorDetails);

        _log.fine(
          'handleStartup | succeeded in logging in, going to main route.',
        );

        await _yuRouter.pushAndPopUntil(
          MainRoute(),
          predicate: (_) => false,
        );
      } on ApiServiceException catch (e) {
        _log.severe(
          'handleStartup | caught ApiServiceException logging in automatically: ${e.type}.',
        );

        // TODO(yazeedalkhalaf): show a snack bar with the error mapped message.
        await _yuRouter.pushAndPopUntil(
          const LoginRoute(),
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
