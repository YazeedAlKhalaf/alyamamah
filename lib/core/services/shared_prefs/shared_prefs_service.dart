import 'dart:convert';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/map_day_schedule_entries.dart';
import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This will be overrided in the ProviderScope that is in the App widget.
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedPrefsServiceProvider = Provider(
  (ref) => SharedPrefsService(
    sharedPreferences: ref.read(sharedPreferencesProvider),
  ),
);

class SharedPrefsService {
  final SharedPreferences _sharedPreferences;

  SharedPrefsService({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  String? getUsername() {
    return _sharedPreferences.getString(Constants.usernameKey);
  }

  String? getPassword() {
    return _sharedPreferences.getString(Constants.passwordKey);
  }

  Future<void> saveUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    await _sharedPreferences.setString(Constants.usernameKey, username);
    await _sharedPreferences.setString(Constants.passwordKey, password);
  }

  Future<void> deleteUsernameAndPassword() async {
    await _sharedPreferences.remove(Constants.usernameKey);
    await _sharedPreferences.remove(Constants.passwordKey);
  }

  String? getAccessToken() {
    return _sharedPreferences.getString(Constants.accessTokenKey);
  }

  Future<void> saveAccessToken({required String accessToken}) async {
    await _sharedPreferences.setString(Constants.accessTokenKey, accessToken);
  }

  Future<void> deleteAccessToken() async {
    await _sharedPreferences.remove(Constants.accessTokenKey);
  }

  String? getLocale() {
    return _sharedPreferences.getString(Constants.localeKey);
  }

  Future<void> saveLocale(String locale) async {
    await _sharedPreferences.setString(Constants.localeKey, locale);
  }

  Future<void> deleteLocale() async {
    await _sharedPreferences.remove(Constants.localeKey);
  }

  String? getThemeMode() {
    return _sharedPreferences.getString(Constants.themeModeKey);
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await _sharedPreferences.setString(Constants.themeModeKey, themeMode.name);
  }

  Future<void> deleteThemeMode() async {
    await _sharedPreferences.remove(Constants.themeModeKey);
  }

  Future<void> saveRamadanMode(bool value) async {
    await _sharedPreferences.setBool(Constants.ramadanModeKey, value);
  }

  bool? getRamadanMode() {
    return _sharedPreferences.getBool(Constants.ramadanModeKey);
  }

  Future<void> deleteRamadanMode() async {
    await _sharedPreferences.remove(Constants.ramadanModeKey);
  }

  Future<void> saveLink(String userId, String section, String link) async {
    await _sharedPreferences.setString(
      '$userId-$section-${Constants.linkKey}',
      link,
    );
  }

  String? getLink(String userId, String section) {
    return _sharedPreferences.getString(
      '$userId-$section-${Constants.linkKey}',
    );
  }

  Future<void> deleteLink(String userId, String section) async {
    await _sharedPreferences.remove(
      '$userId-$section-${Constants.linkKey}',
    );
  }

  Future<void> saveScheduleDays(
    Map<Day, List<ScheduleEntry>> scheduleDays,
  ) async {
    await _sharedPreferences.setString(
      Constants.scheduleDaysKey,
      scheduleDays.toJson(),
    );
  }

  Map<Day, List<ScheduleEntry>>? getScheduleDays() {
    final scheduleDaysJson = _sharedPreferences.getString(
      Constants.scheduleDaysKey,
    );

    if (scheduleDaysJson == null) {
      return null;
    }

    return mapDayScheduleEntriesFromJson(scheduleDaysJson);
  }

  Future<void> deleteScheduleDays() async {
    await _sharedPreferences.remove(Constants.scheduleDaysKey);
  }

  Future<void> saveAbsences(List<Absence> absences) async {
    await _sharedPreferences.setString(
      Constants.absencesKey,
      jsonEncode(absences.map((entry) => entry.toMap()).toList()),
    );
  }

  List<Absence>? getAbsences() {
    final absencesJson = _sharedPreferences.getString(Constants.absencesKey);

    if (absencesJson == null) {
      return null;
    }

    return (jsonDecode(absencesJson) as List).map(
      (absence) {
        return Absence.fromJson(jsonEncode(absence));
      },
    ).toList();
  }

  Future<void> deleteAbsences() async {
    await _sharedPreferences.remove(Constants.absencesKey);
  }

  Future<void> deleteEverything() async {
    await _sharedPreferences.clear();
  }
}
