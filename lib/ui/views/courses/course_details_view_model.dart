import 'package:alyamamah/core/extensions/string.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseDetailsViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => CourseDetailsViewModel(
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    ref: ref,
  ),
);

class CourseDetailsViewModel extends ChangeNotifier {
  final SharedPrefsService _sharedPrefsService;
  final Ref _ref;

  String? get userId => _ref.read(actorDetailsProvider)?.sessionInfo.uniNo;

  CourseDetailsViewModel({
    required SharedPrefsService sharedPrefsService,
    required Ref ref,
  })  : _sharedPrefsService = sharedPrefsService,
        _ref = ref;

  String? _link;
  String? get link => _link;

  void initialize({
    required String section,
  }) {
    if (userId != null) {
      _link = _sharedPrefsService.getLink(userId!, section);
    }
  }

  Future<void> updateLink({
    required String section,
    required String link,
  }) async {
    final userId = this.userId;
    if (userId != null) {
      if (link.isValidUrl()) {
        await _sharedPrefsService.saveLink(userId, section, link);
        _link = _sharedPrefsService.getLink(userId, section);
        notifyListeners();
      }
    }
  }

  Future<void> deleteLink({
    required String section,
  }) async {
    final userId = this.userId;
    if (userId != null) {
      await _sharedPrefsService.deleteLink(userId, section);
      _link = _sharedPrefsService.getLink(userId, section);
      notifyListeners();
    }
  }
}
