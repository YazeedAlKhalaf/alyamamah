class FeatureFlagsState {
  final bool isAlyamamahGptEnabled;
  final bool isScheduleBuilderEnabled;
  final bool isScheduleHourLabelsEnabled;
  final bool isNumberGradesEnabled;
  final bool isAppEnabled;

  FeatureFlagsState({
    this.isAlyamamahGptEnabled = false,
    this.isScheduleBuilderEnabled = false,
    this.isScheduleHourLabelsEnabled = false,
    this.isNumberGradesEnabled = false,
    this.isAppEnabled = true,
  });

  FeatureFlagsState copyWith({
    required bool isAlyamamahGptEnabled,
    required bool isScheduleBuilderEnabled,
    required bool isScheduleHourLabelsEnabled,
    required bool isNumberGradesEnabled,
    required bool isAppEnabled,
  }) {
    return FeatureFlagsState(
      isAlyamamahGptEnabled: isAlyamamahGptEnabled,
      isScheduleBuilderEnabled: isScheduleBuilderEnabled,
      isScheduleHourLabelsEnabled: isScheduleHourLabelsEnabled,
      isNumberGradesEnabled: isNumberGradesEnabled,
      isAppEnabled: isAppEnabled,
    );
  }

  @override
  bool operator ==(covariant FeatureFlagsState other) {
    if (identical(this, other)) return true;

    return other.isAlyamamahGptEnabled == isAlyamamahGptEnabled &&
        other.isScheduleBuilderEnabled == isScheduleBuilderEnabled &&
        other.isScheduleHourLabelsEnabled == isScheduleHourLabelsEnabled &&
        other.isNumberGradesEnabled == isNumberGradesEnabled &&
        other.isAppEnabled == isAppEnabled;
  }

  @override
  int get hashCode =>
      isAlyamamahGptEnabled.hashCode ^
      isScheduleBuilderEnabled.hashCode ^
      isScheduleHourLabelsEnabled.hashCode ^
      isNumberGradesEnabled.hashCode ^
      isAppEnabled.hashCode;
}
