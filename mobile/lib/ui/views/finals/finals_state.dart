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
  final bool showEndedExams;

  const FinalsState({
    this.status = FinalsStatus.unknown,
    this.finals = const [],
    this.showEndedExams = false,
  });

  FinalsState copyWith({
    FinalsStatus? status,
    List<FinalExam>? finals,
    bool? showEndedExams,
  }) {
    return FinalsState(
      status: status ?? this.status,
      finals: finals ?? this.finals,
      showEndedExams: showEndedExams ?? this.showEndedExams,
    );
  }

  @override
  bool operator ==(covariant FinalsState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.finals, finals) &&
        other.showEndedExams == showEndedExams;
  }

  @override
  int get hashCode =>
      status.hashCode ^ finals.hashCode ^ showEndedExams.hashCode;

  @override
  String toString() =>
      'FinalsState(status: $status, finals: $finals, showEndedExams: $showEndedExams)';
}
