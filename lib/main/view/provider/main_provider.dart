// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainState {
  final int navigationBarIndex;

  MainState({
    this.navigationBarIndex = 0,
  });

  MainState copyWith({
    int? navigationBarIndex,
  }) {
    return MainState(
      navigationBarIndex: navigationBarIndex ?? this.navigationBarIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'navigationBarIndex': navigationBarIndex,
    };
  }

  factory MainState.fromMap(Map<String, dynamic> map) {
    return MainState(
      navigationBarIndex: map['navigationBarIndex'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainState.fromJson(String source) =>
      MainState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MainState(navigationBarIndex: $navigationBarIndex)';

  @override
  bool operator ==(covariant MainState other) {
    if (identical(this, other)) return true;

    return other.navigationBarIndex == navigationBarIndex;
  }

  @override
  int get hashCode => navigationBarIndex.hashCode;
}

final mainProvider = StateNotifierProvider<MainNotifier, MainState>(
  (ref) => MainNotifier(),
);

class MainNotifier extends StateNotifier<MainState> {
  MainNotifier() : super(MainState());

  void setNavigationBarIndex(int index) {
    state = state.copyWith(
      navigationBarIndex: index,
    );
  }
}
