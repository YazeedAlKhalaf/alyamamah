import 'package:alyamamah/core/providers/feature_flags/featrure_flags_state.dart';
import 'package:alyamamah/core/services/unleash/unleash_flags.dart';
import 'package:alyamamah/core/services/unleash/unleash_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featureFlagsStateNotifierProvider =
    StateNotifierProvider<FeatureFlagsStateNotifier, FeatureFlagsState>(
  (ref) {
    return FeatureFlagsStateNotifier(
      unleashService: ref.read(unleashServiceProvider),
    );
  },
);

class FeatureFlagsStateNotifier extends StateNotifier<FeatureFlagsState> {
  final UnleashService _unleashService;

  FeatureFlagsStateNotifier({
    required UnleashService unleashService,
  })  : _unleashService = unleashService,
        super(FeatureFlagsState());

  Future<void> init({required String userId}) async {
    await _unleashService.setOnUpdateHandler(() {
      updateState();
    });
    await _unleashService.setUserId(userId);

    state = state.copyWith(
      isScheduleBuilderEnabled: _unleashService.isEnabled(
        UnleashFlags.scheduleBuilder,
      ),
      isScheduleHourLabelsEnabled: _unleashService.isEnabled(
        UnleashFlags.scheduleHoursLabels,
      ),
      isNumberGradesEnabled: _unleashService.isEnabled(
        UnleashFlags.numberGrades,
      ),
      isAppEnabled: _unleashService.isEnabled(
        UnleashFlags.appEnabled,
      ),
      isStudentCouncilFeedbackEnabled: _unleashService.isEnabled(
        UnleashFlags.studentCouncilFeedback,
      ),
    );
  }

  @visibleForTesting
  void updateState() {
    state = state.copyWith(
      isScheduleBuilderEnabled: _unleashService.isEnabled(
        UnleashFlags.scheduleBuilder,
      ),
      isScheduleHourLabelsEnabled: _unleashService.isEnabled(
        UnleashFlags.scheduleHoursLabels,
      ),
      isNumberGradesEnabled: _unleashService.isEnabled(
        UnleashFlags.numberGrades,
      ),
      isAppEnabled: _unleashService.isEnabled(
        UnleashFlags.appEnabled,
      ),
      isStudentCouncilFeedbackEnabled: _unleashService.isEnabled(
        UnleashFlags.studentCouncilFeedback,
      ),
    );
  }

  Future<void> resetState() async {
    state = FeatureFlagsState();
    await _unleashService.deleteUserId();
  }
}
