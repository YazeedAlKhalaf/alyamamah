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

  const ChatsViewState({
    this.status = ChatsViewStatus.unknown,
    this.chats = const [],
  });

  ChatsViewState copyWith({
    ChatsViewStatus? status,
    List<CubeDialog>? chats,
  }) {
    return ChatsViewState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
    );
  }

  @override
  bool operator ==(covariant ChatsViewState other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.chats, chats);
  }

  @override
  int get hashCode => status.hashCode ^ chats.hashCode;

  @override
  String toString() => 'ChatsViewState(status: $status, chats: $chats)';
}
