class FeatureFlagsState {
  final bool isAlyamamahGptEnabled;

  FeatureFlagsState({
    this.isAlyamamahGptEnabled = false,
  });

  FeatureFlagsState copyWith({
    required bool isAlyamamahGptEnabled,
  }) {
    return FeatureFlagsState(
      isAlyamamahGptEnabled: isAlyamamahGptEnabled,
    );
  }

  @override
  bool operator ==(covariant FeatureFlagsState other) {
    if (identical(this, other)) return true;

    return other.isAlyamamahGptEnabled == isAlyamamahGptEnabled;
  }

  @override
  int get hashCode => isAlyamamahGptEnabled.hashCode;
}
