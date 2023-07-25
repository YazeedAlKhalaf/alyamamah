import 'package:alyamamah/core/models/schedule.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/foundation.dart';

enum ChatsViewStatus {
  unknown,
  loading,
  loaded,
  errorLoading,
  syncingChats,
}

class ChatsViewState {
  final ChatsViewStatus status;
  final List<CubeDialog> chats;
  final List<Schedule> schedules;

  const ChatsViewState({
    this.status = ChatsViewStatus.unknown,
    this.chats = const [],
    this.schedules = const [],
  });

  ChatsViewState copyWith({
    ChatsViewStatus? status,
    List<CubeDialog>? chats,
    List<Schedule>? schedules,
  }) {
    return ChatsViewState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      schedules: schedules ?? this.schedules,
    );
  }

  @override
  bool operator ==(covariant ChatsViewState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.chats, chats) &&
        listEquals(other.schedules, schedules);
  }

  @override
  int get hashCode => status.hashCode ^ chats.hashCode ^ schedules.hashCode;

  @override
  String toString() =>
      'ChatsViewState(status: $status, chats: $chats, schedules: $schedules)';
}
