// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:alyamamah/app/misc/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationState {
  final String? sessionId;
  final bool isLoading;

  AuthenticationState({
    this.sessionId,
    this.isLoading = false,
  });

  AuthenticationState copyWith({
    String? sessionId,
    bool? isLoading,
  }) {
    return AuthenticationState(
      sessionId: sessionId ?? this.sessionId,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sessionId': sessionId,
      'isLoading': isLoading,
    };
  }

  factory AuthenticationState.fromMap(Map<String, dynamic> map) {
    return AuthenticationState(
      sessionId: map['sessionId'] != null ? map['sessionId'] as String : null,
      isLoading: map['isLoading'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationState.fromJson(String source) =>
      AuthenticationState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AuthenticationState(sessionId: $sessionId, isLoading: $isLoading)';

  @override
  bool operator ==(covariant AuthenticationState other) {
    if (identical(this, other)) return true;

    return other.sessionId == sessionId && other.isLoading == isLoading;
  }

  @override
  int get hashCode => sessionId.hashCode ^ isLoading.hashCode;
}

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
  (ref) => AuthenticationNotifier(),
);

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier() : super(AuthenticationState());

  Future<void> updateAuthenticationState() async {
    state = state.copyWith(
      isLoading: true,
    );

    final sharedPrefs = await SharedPreferences.getInstance();
    final sessionId = sharedPrefs.getString(Constants.jSessionIdKey);

    state = state.copyWith(
      sessionId: sessionId,
      isLoading: false,
    );
  }
}
