// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:alyamamah/app/misc/constants.dart';
import 'package:alyamamah/app/repository/yamamah_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationState {
  final bool isLoggedIn;
  final bool isGettingLoginInfo;
  final String username;
  final String password;

  AuthenticationState({
    this.isLoggedIn = false,
    this.isGettingLoginInfo = true,
    this.username = '',
    this.password = '',
  });

  AuthenticationState copyWith({
    bool? isLoggedIn,
    bool? isGettingLoginInfo,
    String? username,
    String? password,
  }) {
    return AuthenticationState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isGettingLoginInfo: isGettingLoginInfo ?? this.isGettingLoginInfo,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLoggedIn': isLoggedIn,
      'isGettingLoginInfo': isGettingLoginInfo,
      'username': username,
      'password': password,
    };
  }

  factory AuthenticationState.fromMap(Map<String, dynamic> map) {
    return AuthenticationState(
      isLoggedIn: map['isLoggedIn'] as bool,
      isGettingLoginInfo: map['isGettingLoginInfo'] as bool,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationState.fromJson(String source) =>
      AuthenticationState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthenticationState(isLoggedIn: $isLoggedIn, isGettingLoginInfo: $isGettingLoginInfo, username: $username, password: $password)';
  }

  @override
  bool operator ==(covariant AuthenticationState other) {
    if (identical(this, other)) return true;

    return other.isLoggedIn == isLoggedIn &&
        other.isGettingLoginInfo == isGettingLoginInfo &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    return isLoggedIn.hashCode ^
        isGettingLoginInfo.hashCode ^
        username.hashCode ^
        password.hashCode;
  }
}

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
  (ref) => AuthenticationNotifier(
    yamamahRepository: ref.read(yamamahRepositoryProvider),
  ),
);

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier({
    required YamamahRepository yamamahRepository,
  })  : _yamamahRepository = yamamahRepository,
        super(AuthenticationState());

  final YamamahRepository _yamamahRepository;

  Future<void> loginWithUsernameAndPasswordIfFound() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final username = sharedPrefs.getString(Constants.usernameKey);
    final password = sharedPrefs.getString(Constants.passwordKey);
    state = state.copyWith(
      username: username,
      password: password,
    );

    if (username != null && password != null) {
      try {
        await _yamamahRepository.login(
          username: username,
          password: password,
        );

        state = state.copyWith(
          isGettingLoginInfo: false,
          isLoggedIn: true,
        );
      } on YamamahException {
        state = state.copyWith(
          isGettingLoginInfo: false,
          isLoggedIn: false,
        );
      }
      return;
    }

    state = state.copyWith(
      isGettingLoginInfo: false,
      isLoggedIn: false,
    );
  }

  Future<void> updateAuthenticationState({
    required bool isLoggedIn,
  }) async {
    state = state.copyWith(
      isLoggedIn: isLoggedIn,
    );
  }

  Future<void> logout() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.remove(Constants.usernameKey);
    await sharedPrefs.remove(Constants.passwordKey);

    state = state.copyWith(
      isLoggedIn: false,
    );
  }
}
