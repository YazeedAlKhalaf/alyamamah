// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:alyamamah/app/misc/constants.dart';
import 'package:alyamamah/app/repository/yamamah_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState {
  final String username;
  final String password;
  final bool rememberMe;
  final String? error;
  final bool isLoading;
  final bool showPassword;

  LoginState({
    this.username = '',
    this.password = '',
    this.rememberMe = false,
    this.error,
    this.isLoading = false,
    this.showPassword = false,
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? rememberMe,
    String? error,
    bool? isLoading,
    bool? showPassword,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'rememberMe': rememberMe,
      'error': error,
      'isLoading': isLoading,
      'showPassword': showPassword,
    };
  }

  factory LoginState.fromMap(Map<String, dynamic> map) {
    return LoginState(
      username: map['username'] as String,
      password: map['password'] as String,
      rememberMe: map['rememberMe'] as bool,
      error: map['error'] != null ? map['error'] as String : null,
      isLoading: map['isLoading'] as bool,
      showPassword: map['showPassword'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginState.fromJson(String source) =>
      LoginState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginState(username: $username, password: $password, rememberMe: $rememberMe, error: $error, isLoading: $isLoading, showPassword: $showPassword)';
  }

  @override
  bool operator ==(covariant LoginState other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.rememberMe == rememberMe &&
        other.error == error &&
        other.isLoading == isLoading &&
        other.showPassword == showPassword;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        rememberMe.hashCode ^
        error.hashCode ^
        isLoading.hashCode ^
        showPassword.hashCode;
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(
    yamamahRepository: YamamahRepository(client: Client()),
  ),
);

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({
    required YamamahRepository yamamahRepository,
  })  : _yamamahRepository = yamamahRepository,
        super(LoginState());

  final YamamahRepository _yamamahRepository;

  void setRememberMe(bool? value) {
    state = state.copyWith(
      rememberMe: value ?? false,
    );
  }

  void setUsername(String value) {
    state = state.copyWith(
      username: value,
    );
  }

  void setPassword(String value) {
    state = state.copyWith(
      password: value,
    );
  }

  void toggleShowPassword() {
    state = state.copyWith(
      showPassword: !state.showPassword,
    );
  }

  Future<void> login() async {
    try {
      if (state.username.isEmpty || state.password.isEmpty) {
        state = state.copyWith(
          error: 'username or password cannot be empty.',
        );
        return;
      }

      state = state.copyWith(
        isLoading: true,
      );

      await _yamamahRepository.login(
        username: state.username,
        password: state.password,
      );
    } on YamamahException {
      state = state.copyWith(
        isLoading: false,
        error: 'something went wrong while trying to log you in.',
      );
      return;
    }

    if (state.rememberMe) {
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString(Constants.usernameKey, state.username);
      await sharedPrefs.setString(Constants.passwordKey, state.password);
    }

    state = state.copyWith(
      isLoading: false,
    );
  }
}
