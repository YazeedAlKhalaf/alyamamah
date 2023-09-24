class FeatureFlagsState {
  final bool isScheduleBuilderEnabled;
  final bool isScheduleHourLabelsEnabled;
  final bool isNumberGradesEnabled;
  final bool isAppEnabled;

  FeatureFlagsState({
    this.isScheduleBuilderEnabled = false,
    this.isScheduleHourLabelsEnabled = false,
    this.isNumberGradesEnabled = false,
    this.isAppEnabled = true,
  });

  FeatureFlagsState copyWith({
    required bool isScheduleBuilderEnabled,
    required bool isScheduleHourLabelsEnabled,
    required bool isNumberGradesEnabled,
    required bool isAppEnabled,
  }) {
    return FeatureFlagsState(
      isScheduleBuilderEnabled: isScheduleBuilderEnabled,
      isScheduleHourLabelsEnabled: isScheduleHourLabelsEnabled,
      isNumberGradesEnabled: isNumberGradesEnabled,
      isAppEnabled: isAppEnabled,
    );
  }

  @override
  bool operator ==(covariant FeatureFlagsState other) {
    if (identical(this, other)) return true;

    return other.isScheduleBuilderEnabled == isScheduleBuilderEnabled &&
        other.isScheduleHourLabelsEnabled == isScheduleHourLabelsEnabled &&
        other.isNumberGradesEnabled == isNumberGradesEnabled &&
        other.isAppEnabled == isAppEnabled;
  }

  @override
  int get hashCode =>
      isScheduleBuilderEnabled.hashCode ^
      isScheduleHourLabelsEnabled.hashCode ^
      isNumberGradesEnabled.hashCode ^
      isAppEnabled.hashCode;
}
