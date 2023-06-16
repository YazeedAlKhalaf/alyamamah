import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/ui/views/grades/grades_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gradesViewModelProvider =
    StateNotifierProvider<GradesViewModel, GradesViewState>(
  (ref) => GradesViewModel(
    apiService: ref.read(apiServiceProvider),
    initialSemester:
        ref.read(actorDetailsProvider)?.semester.currentSemester ?? '',
  ),
);

class GradesViewModel extends StateNotifier<GradesViewState> {
  final ApiService _apiService;

  GradesViewModel({
    required ApiService apiService,
    required String initialSemester,
  })  : _apiService = apiService,
        super(
          GradesViewState(
            selectedSemester: initialSemester,
          ),
        );

  Future<void> getCoursesResults() async {
    try {
      state = state.copyWith(
        status: GradesViewStatus.loading,
      );

      final coursesResults = await _apiService.getCoursesResults(
        semester: state.selectedSemester,
      );

      state = state.copyWith(
        status: GradesViewStatus.loaded,
        coursesResults: coursesResults,
      );
    } on ApiServiceException {
      state = state.copyWith(
        status: GradesViewStatus.errorLoading,
      );
    }
  }

  Future<void> changeSemester(String newSemesterValue) async {
    state = state.copyWith(
      selectedSemester: newSemesterValue,
    );

    await getCoursesResults();
  }
}
