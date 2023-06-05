import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/rev_cat/rev_cat_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/widget_kit/widget_kit_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final profileViewModelProvider = ChangeNotifierProvider(
  (ref) => ProfileViewModel(
    yuRouter: ref.read(yuRouterProvider),
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    actorDetailsNotifier: ref.read(actorDetailsProvider.notifier),
    apiService: ref.read(apiServiceProvider),
    widgetKitService: ref.read(widgetKitSerivceProvider),
    revCatService: ref.read(revCatServiceProvider),
  ),
);

class ProfileViewModel extends ChangeNotifier {
  final _log = Logger('ProfileViewModel');

  final YURouter _yuRouter;
  final SharedPrefsService _sharedPrefsService;
  final ActorDetailsNotifier _actorDetailsNotifier;
  final ApiService _apiService;
  final WidgetKitService _widgetKitService;
  final RevCatService _revCatService;

  ProfileViewModel({
    required YURouter yuRouter,
    required SharedPrefsService sharedPrefsService,
    required ActorDetailsNotifier actorDetailsNotifier,
    required ApiService apiService,
    required WidgetKitService widgetKitService,
    required RevCatService revCatService,
  })  : _yuRouter = yuRouter,
        _sharedPrefsService = sharedPrefsService,
        _actorDetailsNotifier = actorDetailsNotifier,
        _apiService = apiService,
        _widgetKitService = widgetKitService,
        _revCatService = revCatService;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  bool _isRestoring = false;
  bool get isRestoring => _isRestoring;

  Future<void> navigateToStudentInfo() async {
    await _yuRouter.push(const StudentInfoRoute());
  }

  Future<void> navigateToPaywallView({
    required String title,
    required String description,
    required List<Package> packages,
    required CustomerInfo customerInfo,
  }) async {
    await _yuRouter.push(PaywallRoute(
      title: title,
      description: description,
      packages: packages,
      customerInfo: customerInfo,
    ));
  }

  Future<void> navigateToYuGptView() async {
    await _yuRouter.push(const YuGptRoute());
  }

  Future<void> logout() async {
    _log.info('logout | Logging out.');
    _isBusy = true;
    notifyListeners();

    await _sharedPrefsService.deleteEverything();
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

  Future<void> restorePurchases() async {
    _log.info('restorePurchases | Restoring purchases.');
    _isRestoring = true;
    notifyListeners();

    final customerInfo = await _revCatService.restore();
    if (customerInfo == null) {
      _log.info('restorePurchases | Couldn\'t restore purchases.');
      _isRestoring = false;
      notifyListeners();
      return;
    }

    _log.info('restorePurchases | customerInfo: $customerInfo');
    _isRestoring = false;
    notifyListeners();
  }
}
