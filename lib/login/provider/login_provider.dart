// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

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
  (ref) => LoginNotifier(),
);

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());

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
    if (state.username.isEmpty || state.password.isEmpty) {
      state = state.copyWith(
        error: 'username or password cannot be empty.',
      );
      return;
    }

    state = state.copyWith(
      isLoading: true,
    );

    final client = Client();

    final response = await client.get(
      Uri.parse(
        'https://edugate.yu.edu.sa/yu/resources/common/commonServies/actorDetails/1/1/1',
      ),
      headers: {
        'Authorization':
            'Basic ${base64Encode('${state.username}:${state.password}'.runes.toList())}',
      },
    );

    state = state.copyWith(
      isLoading: false,
    );

    print(response.body);

    if (response.statusCode == 200) {
      state = state.copyWith();
      return;
    }

    state = state.copyWith(
      error: 'something went wrong while trying to log you in.',
    );
  }
}
