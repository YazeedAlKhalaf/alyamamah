class FeatureFlagsState {
  final bool isScheduleBuilderEnabled;
  final bool isScheduleHourLabelsEnabled;
  final bool isNumberGradesEnabled;
  final bool isAppEnabled;
  final bool isStudentCouncilFeedbackEnabled;
  final bool isShareContactInfoEnabled;

  FeatureFlagsState({
    this.isScheduleBuilderEnabled = false,
    this.isScheduleHourLabelsEnabled = false,
    this.isNumberGradesEnabled = false,
    this.isAppEnabled = true,
    this.isStudentCouncilFeedbackEnabled = false,
    this.isShareContactInfoEnabled = false,
  });

  FeatureFlagsState copyWith({
    required bool isScheduleBuilderEnabled,
    required bool isScheduleHourLabelsEnabled,
    required bool isNumberGradesEnabled,
    required bool isAppEnabled,
    required bool isStudentCouncilFeedbackEnabled,
    required bool isShareContactInfoEnabled,
  }) {
    return FeatureFlagsState(
      isScheduleBuilderEnabled: isScheduleBuilderEnabled,
      isScheduleHourLabelsEnabled: isScheduleHourLabelsEnabled,
      isNumberGradesEnabled: isNumberGradesEnabled,
      isAppEnabled: isAppEnabled,
      isStudentCouncilFeedbackEnabled: isStudentCouncilFeedbackEnabled,
      isShareContactInfoEnabled: isShareContactInfoEnabled,
    );
  }

  @override
  bool operator ==(covariant FeatureFlagsState other) {
    if (identical(this, other)) return true;

    return other.isScheduleBuilderEnabled == isScheduleBuilderEnabled &&
        other.isScheduleHourLabelsEnabled == isScheduleHourLabelsEnabled &&
        other.isNumberGradesEnabled == isNumberGradesEnabled &&
        other.isAppEnabled == isAppEnabled &&
        other.isStudentCouncilFeedbackEnabled ==
            isStudentCouncilFeedbackEnabled &&
        other.isShareContactInfoEnabled == isShareContactInfoEnabled;
  }

  @override
  int get hashCode =>
      isScheduleBuilderEnabled.hashCode ^
      isScheduleHourLabelsEnabled.hashCode ^
      isNumberGradesEnabled.hashCode ^
      isAppEnabled.hashCode ^
      isStudentCouncilFeedbackEnabled.hashCode ^
      isShareContactInfoEnabled.hashCode;
}
