import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final studentInfoViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => StudentInfoViewModel(
    apiService: ref.read(apiServiceProvider),
    actorDetailsNotifier: ref.read(actorDetailsProvider.notifier),
  ),
);

class StudentInfoViewModel extends ChangeNotifier {
  final _log = Logger('StudentInfoViewModel');

  final ApiService _apiService;
  final ActorDetailsNotifier _actorDetailsNotifier;

  StudentInfoViewModel({
    required ApiService apiService,
    required ActorDetailsNotifier actorDetailsNotifier,
  })  : _apiService = apiService,
        _actorDetailsNotifier = actorDetailsNotifier;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> refreshStudentInfo({
    required Locale locale,
  }) async {
    _isLoading = true;
    notifyListeners();

    final changeLanguageLocale = locale.mapToChangeLanguageLocale();

    try {
      final actorDetails = await _apiService.getActorDetails(
        changeLanguageLocale: changeLanguageLocale,
      );

      _actorDetailsNotifier.setActorDetails(actorDetails);
    } on ApiServiceException {
      _log.severe('refreshStudentInfo | failed to get student info.');
    }

    _isLoading = false;
    notifyListeners();
  }
}
