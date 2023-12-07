import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/providers/feature_flags/feature_flags_state_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/widget_kit/widget_kit_service.dart';
import 'package:alyamamah/core/services/widget_kit/widget_kit_service_exception.dart';
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
    featureFlagsStateNotifier:
        ref.read(featureFlagsStateNotifierProvider.notifier),
  ),
);

class ProfileViewModel extends ChangeNotifier {
  final _log = Logger('ProfileViewModel');

  final YURouter _yuRouter;
  final SharedPrefsService _sharedPrefsService;
  final ActorDetailsNotifier _actorDetailsNotifier;
  final ApiService _apiService;
  final WidgetKitService _widgetKitService;
  final FeatureFlagsStateNotifier _featureFlagsStateNotifier;

  ProfileViewModel({
    required YURouter yuRouter,
    required SharedPrefsService sharedPrefsService,
    required ActorDetailsNotifier actorDetailsNotifier,
    required ApiService apiService,
    required WidgetKitService widgetKitService,
    required FeatureFlagsStateNotifier featureFlagsStateNotifier,
  })  : _yuRouter = yuRouter,
        _sharedPrefsService = sharedPrefsService,
        _actorDetailsNotifier = actorDetailsNotifier,
        _apiService = apiService,
        _widgetKitService = widgetKitService,
        _featureFlagsStateNotifier = featureFlagsStateNotifier;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  Future<void> navigateToStudentInfo() async {
    await _yuRouter.push(const StudentInfoRoute());
  }

  Future<void> navigateToFeedbackListRoute() async {
    await _yuRouter.push(const FeedbackListRoute());
  }

  Future<void> logout() async {
    try {
      _log.info('logout | Logging out.');
      _isBusy = true;
      notifyListeners();

      await _apiService.logout();
      await _sharedPrefsService.deleteEverything();

      await _widgetKitService.deleteCoursesWidgetData();

      await _featureFlagsStateNotifier.resetState();

      // Keep this at the end so the ui data doesn't disappear for too long if
      // the calls above take a while.
      _actorDetailsNotifier.setActorDetails(null);

      await _yuRouter.pushAndPopUntil(
        const LoginRoute(),
        predicate: (_) => false,
      );
      _isBusy = false;
      notifyListeners();
    } on WidgetKitServiceException catch (e) {
      _log.severe('logout | failed to deleteCoursesWidgetData: $e');
    } catch (e) {
      _log.severe('logout | failed to logout for unexpected reason: $e');
      _isBusy = false;
      notifyListeners();
    }
  }
}
