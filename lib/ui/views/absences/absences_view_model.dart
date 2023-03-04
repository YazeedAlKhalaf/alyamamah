import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final absencesViewModelProvider = ChangeNotifierProvider(
  (ref) => AbsencesViewModel(
    apiService: ref.read(apiServiceProvider),
    yuRouter: ref.read(yuRouterProvider),
  ),
);

class AbsencesViewModel extends ChangeNotifier {
  final _log = Logger('AbsencesViewModel');

  final ApiService _apiService;
  final YURouter _yuRouter;

  AbsencesViewModel({
    required ApiService apiService,
    required YURouter yuRouter,
  })  : _apiService = apiService,
        _yuRouter = yuRouter;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  List<Absence> _absences = [];
  List<Absence> get absences => _absences;

  Future<void> getAbsences() async {
    _isBusy = true;
    notifyListeners();

    try {
      _absences = await _apiService.getAbsences();
    } on ApiServiceException catch (e) {
      _log.severe('getAbsences() | exception: $e');
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
