class FeatureFlagsState {
  final bool isAlyamamahGptEnabled;
  final bool isScheduleBuilderEnabled;

  FeatureFlagsState({
    this.isAlyamamahGptEnabled = false,
    this.isScheduleBuilderEnabled = false,
  });

  FeatureFlagsState copyWith({
    required bool isAlyamamahGptEnabled,
    required bool isScheduleBuilderEnabled,
  }) {
    return FeatureFlagsState(
      isAlyamamahGptEnabled: isAlyamamahGptEnabled,
      isScheduleBuilderEnabled: isScheduleBuilderEnabled,
    );
  }

  @override
  bool operator ==(covariant FeatureFlagsState other) {
    if (identical(this, other)) return true;

    return other.isAlyamamahGptEnabled == isAlyamamahGptEnabled &&
        other.isScheduleBuilderEnabled == isScheduleBuilderEnabled;
  }

  @override
  int get hashCode =>
      isAlyamamahGptEnabled.hashCode ^ isScheduleBuilderEnabled.hashCode;
}
