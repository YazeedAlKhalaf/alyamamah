import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/widget_kit/widget_kit_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final profileViewModelProvider = ChangeNotifierProvider(
  (ref) => ProfileViewModel(
    yuRouter: ref.read(yuRouterProvider),
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    actorDetailsNotifier: ref.read(actorDetailsProvider.notifier),
    apiService: ref.read(apiServiceProvider),
    widgetKitService: ref.read(widgetKitSerivceProvider),
  ),
);

class ProfileViewModel extends ChangeNotifier {
  final _log = Logger('ProfileViewModel');

  final YURouter _yuRouter;
  final SharedPrefsService _sharedPrefsService;
  final ActorDetailsNotifier _actorDetailsNotifier;
  final ApiService _apiService;
  final WidgetKitService _widgetKitService;

  ProfileViewModel({
    required YURouter yuRouter,
    required SharedPrefsService sharedPrefsService,
    required ActorDetailsNotifier actorDetailsNotifier,
    required ApiService apiService,
    required WidgetKitService widgetKitService,
  })  : _yuRouter = yuRouter,
        _sharedPrefsService = sharedPrefsService,
        _actorDetailsNotifier = actorDetailsNotifier,
        _apiService = apiService,
        _widgetKitService = widgetKitService;

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
    await _apiService.logout();
    _actorDetailsNotifier.setActorDetails(null);

    await _widgetKitService.deleteCoursesWidgetData();

    await _yuRouter.pushAndPopUntil(
      const LoginRoute(),
      predicate: (_) => false,
    );
    _isBusy = false;
    notifyListeners();
  }
}
