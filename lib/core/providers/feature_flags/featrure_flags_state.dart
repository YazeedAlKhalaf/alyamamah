class FeatureFlagsState {
  final bool isAlyamamahGptEnabled;
  final bool isScheduleBuilderEnabled;
  final bool isScheduleHourLabelsEnabled;
  final bool isNumberGradesEnabled;

  FeatureFlagsState({
    this.isAlyamamahGptEnabled = false,
    this.isScheduleBuilderEnabled = false,
    this.isScheduleHourLabelsEnabled = false,
    this.isNumberGradesEnabled = false,
  });

  FeatureFlagsState copyWith({
    required bool isAlyamamahGptEnabled,
    required bool isScheduleBuilderEnabled,
    required bool isScheduleHourLabelsEnabled,
    required bool isNumberGradesEnabled,
  }) {
    return FeatureFlagsState(
      isAlyamamahGptEnabled: isAlyamamahGptEnabled,
      isScheduleBuilderEnabled: isScheduleBuilderEnabled,
      isScheduleHourLabelsEnabled: isScheduleHourLabelsEnabled,
      isNumberGradesEnabled: isNumberGradesEnabled,
    );
  }

  @override
  bool operator ==(covariant FeatureFlagsState other) {
    if (identical(this, other)) return true;

    return other.isAlyamamahGptEnabled == isAlyamamahGptEnabled &&
        other.isScheduleBuilderEnabled == isScheduleBuilderEnabled &&
        other.isScheduleHourLabelsEnabled == isScheduleHourLabelsEnabled &&
        other.isNumberGradesEnabled == isNumberGradesEnabled;
  }

  @override
  int get hashCode =>
      isAlyamamahGptEnabled.hashCode ^
      isScheduleBuilderEnabled.hashCode ^
      isScheduleHourLabelsEnabled.hashCode ^
      isNumberGradesEnabled.hashCode;
}
