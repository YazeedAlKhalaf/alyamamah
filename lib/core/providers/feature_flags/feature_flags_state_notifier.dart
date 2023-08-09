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
      isAlyamamahGptEnabled: _unleashService.isEnabled(
        UnleashFlags.alyamamahGpt,
      ),
      isScheduleBuilderEnabled: _unleashService.isEnabled(
        UnleashFlags.scheduleBuilder,
      ),
      isChatEnabled: _unleashService.isEnabled(
        UnleashFlags.chat,
      ),
    );
  }

  @visibleForTesting
  void updateState() {
    state = state.copyWith(
      isAlyamamahGptEnabled: _unleashService.isEnabled(
        UnleashFlags.alyamamahGpt,
      ),
      isScheduleBuilderEnabled: _unleashService.isEnabled(
        UnleashFlags.scheduleBuilder,
      ),
      isChatEnabled: _unleashService.isEnabled(
        UnleashFlags.chat,
      ),
    );
  }

  Future<void> resetState() async {
    state = FeatureFlagsState();
    await _unleashService.deleteUserId();
  }
}
