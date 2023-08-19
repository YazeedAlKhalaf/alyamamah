class FeatureFlagsState {
  final bool isAlyamamahGptEnabled;
  final bool isScheduleBuilderEnabled;
  final bool isScheduleHourLabelsEnabled;

  FeatureFlagsState({
    this.isAlyamamahGptEnabled = false,
    this.isScheduleBuilderEnabled = false,
    this.isScheduleHourLabelsEnabled = false,
  });

  FeatureFlagsState copyWith({
    required bool isAlyamamahGptEnabled,
    required bool isScheduleBuilderEnabled,
    required bool isScheduleHourLabelsEnabled,
  }) {
    return FeatureFlagsState(
      isAlyamamahGptEnabled: isAlyamamahGptEnabled,
      isScheduleBuilderEnabled: isScheduleBuilderEnabled,
      isScheduleHourLabelsEnabled: isScheduleHourLabelsEnabled,
    );
  }

  @override
  bool operator ==(covariant FeatureFlagsState other) {
    if (identical(this, other)) return true;

    return other.isAlyamamahGptEnabled == isAlyamamahGptEnabled &&
        other.isScheduleBuilderEnabled == isScheduleBuilderEnabled &&
        other.isScheduleHourLabelsEnabled == isScheduleHourLabelsEnabled;
  }

  @override
  int get hashCode =>
      isAlyamamahGptEnabled.hashCode ^
      isScheduleBuilderEnabled.hashCode ^
      isScheduleHourLabelsEnabled.hashCode;
}
