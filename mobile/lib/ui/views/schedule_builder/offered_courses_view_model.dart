import 'package:alyamamah/core/models/optional.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/ui/views/schedule_builder/offered_courses_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final offeredCoursesViewModelProvider =
    StateNotifierProvider<OfferedCoursesViewModel, OfferedCoursesViewState>(
  (ref) => OfferedCoursesViewModel(
    apiService: ref.read(apiServiceProvider),
  ),
);

class OfferedCoursesViewModel extends StateNotifier<OfferedCoursesViewState> {
  final _log = Logger('OfferedCoursesViewModel');

  final ApiService _apiService;

  OfferedCoursesViewModel({
    required ApiService apiService,
  })  : _apiService = apiService,
        super(OfferedCoursesViewState());

  Future<void> getOfferedCourses() async {
    try {
      state = OfferedCoursesViewState(
        status: OfferedCoursesViewStatus.loading,
      );

      final offeredCourses = await _apiService.getOfferedCourses();
      final attemptedCourses = await _apiService.getAttemptedCourses();
      final registrationHours = await _apiService.getRegistrationHours();

      state = state.copyWith(
        status: OfferedCoursesViewStatus.loaded,
        offeredCourses: [...offeredCourses, ...attemptedCourses],
        attemptedCourses: attemptedCourses,
        registrationHours: Optional(registrationHours),
        selectedCourseCodes:
            attemptedCourses.map((course) => course.courseCode).toSet(),
      );
    } on ApiServiceException catch (e) {
      _log.severe('error fetching offered courses: $e');

      state = state.copyWith(
        status: OfferedCoursesViewStatus.errorLoading,
      );
    }
  }

  void toggleOfferedCourse(String courseCode) {
    final selectedCourseCodes = Set<String>.from(state.selectedCourseCodes);

    if (selectedCourseCodes.contains(courseCode)) {
      selectedCourseCodes.remove(courseCode);
    } else {
      final creditHours = state.uniqueNameCourses
          .singleWhere(
            (offeredCourse) => offeredCourse.courseCode == courseCode,
          )
          .creditHours;
      if (state.selectedHours + creditHours > state.registrationHours!.maxHrs) {
        return;
      }
      selectedCourseCodes.add(courseCode);
    }

    state = state.copyWith(
      selectedCourseCodes: selectedCourseCodes,
    );
  }
}
