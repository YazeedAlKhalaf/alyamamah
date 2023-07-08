enum GradesViewStatus {
  unknown,
  loading,
  loaded,
  errorLoading,
}

class GradesViewState {
  final GradesViewStatus status;
  final String selectedSemester;

  GradesViewState({
    this.status = GradesViewStatus.unknown,
    required this.selectedSemester,
  });

  GradesViewState copyWith({
    GradesViewStatus? status,
    String? selectedSemester,
  }) {
    return GradesViewState(
      status: status ?? this.status,
      selectedSemester: selectedSemester ?? this.selectedSemester,
    );
  }

  @override
  bool operator ==(covariant GradesViewState other) {
    if (identical(this, other)) return true;

    return other.status == status && other.selectedSemester == selectedSemester;
  }

  @override
  int get hashCode {
    return status.hashCode ^ selectedSemester.hashCode;
  }
}
