import 'package:alyamamah/core/models/final_exam.dart';
import 'package:flutter/foundation.dart';

enum FinalsStatus {
  unknown,
  loadingFinals,
  loadedFinals,
  errorLoadingFinals,
}

class FinalsState {
  final FinalsStatus status;
  final List<FinalExam> finals;

  const FinalsState({
    this.status = FinalsStatus.unknown,
    this.finals = const [],
  });

  FinalsState copyWith({
    FinalsStatus? status,
    List<FinalExam>? finals,
  }) {
    return FinalsState(
      status: status ?? this.status,
      finals: finals ?? this.finals,
    );
  }

  @override
  bool operator ==(covariant FinalsState other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.finals, finals);
  }

  @override
  int get hashCode => status.hashCode ^ finals.hashCode;

  @override
  String toString() => 'FinalsState(status: $status, finals: $finals)';
}
