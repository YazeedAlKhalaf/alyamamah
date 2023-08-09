class FeatureFlagsState {
  final bool isAlyamamahGptEnabled;
  final bool isScheduleBuilderEnabled;
  final bool isChatEnabled;

  FeatureFlagsState({
    this.isAlyamamahGptEnabled = false,
    this.isScheduleBuilderEnabled = false,
    this.isChatEnabled = false,
  });

  FeatureFlagsState copyWith({
    required bool isAlyamamahGptEnabled,
    required bool isScheduleBuilderEnabled,
    required bool isChatEnabled,
  }) {
    return FeatureFlagsState(
      isAlyamamahGptEnabled: isAlyamamahGptEnabled,
      isScheduleBuilderEnabled: isScheduleBuilderEnabled,
      isChatEnabled: isChatEnabled,
    );
  }

  @override
  bool operator ==(covariant FeatureFlagsState other) {
    if (identical(this, other)) return true;

    return other.isAlyamamahGptEnabled == isAlyamamahGptEnabled &&
        other.isScheduleBuilderEnabled == isScheduleBuilderEnabled &&
        other.isChatEnabled == isChatEnabled;
  }

  @override
  int get hashCode =>
      isAlyamamahGptEnabled.hashCode ^
      isScheduleBuilderEnabled.hashCode ^
      isChatEnabled.hashCode;
}
