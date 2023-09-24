import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/ui/views/grades/grades_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gradesViewModelProvider =
    StateNotifierProvider<GradesViewModel, GradesViewState>(
  (ref) => GradesViewModel(
    initialSemester:
        ref.read(actorDetailsProvider)?.semester.currentSemester ?? '',
  ),
);

class GradesViewModel extends StateNotifier<GradesViewState> {
  GradesViewModel({
    required String initialSemester,
  }) : super(GradesViewState(selectedSemester: initialSemester));

  void changeSemester(String newSemesterValue) {
    state = state.copyWith(
      selectedSemester: newSemesterValue,
    );
  }
}
