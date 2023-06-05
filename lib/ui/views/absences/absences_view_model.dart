import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final absencesViewModelProvider = ChangeNotifierProvider(
  (ref) => AbsencesViewModel(
    apiService: ref.read(apiServiceProvider),
    yuRouter: ref.read(yuRouterProvider),
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
  ),
);

class AbsencesViewModel extends ChangeNotifier {
  final _log = Logger('AbsencesViewModel');

  final ApiService _apiService;
  final YURouter _yuRouter;
  final SharedPrefsService _sharedPrefsService;

  AbsencesViewModel({
    required ApiService apiService,
    required YURouter yuRouter,
    required SharedPrefsService sharedPrefsService,
  })  : _apiService = apiService,
        _yuRouter = yuRouter,
        _sharedPrefsService = sharedPrefsService;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  List<Absence> _absences = [];
  List<Absence> get absences => _absences;

  Future<void> getAbsences() async {
    _isBusy = true;
    notifyListeners();

    try {
      _absences = await _apiService.getAbsences();
      await _sharedPrefsService.saveAbsences(absences);
    } on ApiServiceException catch (e) {
      _log.severe('getAbsences() | exception: ${e.type}');

      final absencesCached = _sharedPrefsService.getAbsences();
      _log.info(
        'getAbsences() | using cached data. does cached data exist? ${absencesCached != null}',
      );
      if (absencesCached != null) {
        _absences = absencesCached;
      }
    }

    _isBusy = false;
    notifyListeners();
  }

  Future<void> navigateToAbsenceDetails(Absence absence) async {
    await _yuRouter.push(
      AbsenceDetailsRoute(
        absence: absence,
      ),
    );
  }
}
