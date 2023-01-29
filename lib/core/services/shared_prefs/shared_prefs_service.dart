import 'package:alyamamah/core/constants.dart';
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
}