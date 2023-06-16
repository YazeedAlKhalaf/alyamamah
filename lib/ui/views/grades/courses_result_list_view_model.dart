import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/ui/views/grades/courses_result_list_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coursesResultListViewModelProvider = StateNotifierProvider.autoDispose<
    CoursesResultListViewModel, CoursesResultListViewState>(
  (ref) => CoursesResultListViewModel(
    apiService: ref.read(apiServiceProvider),
  ),
);

class CoursesResultListViewModel
    extends StateNotifier<CoursesResultListViewState> {
  final ApiService _apiService;

  CoursesResultListViewModel({
    required ApiService apiService,
  })  : _apiService = apiService,
        super(CoursesResultListViewState());

  Future<void> getCoursesResults({required String semester}) async {
    try {
      state = state.copyWith(
        status: CoursesResultListViewStatus.loading,
      );

      final coursesResults = await _apiService.getCoursesResults(
        semester: semester,
      );

      state = state.copyWith(
        status: CoursesResultListViewStatus.loaded,
        coursesResults: coursesResults,
      );
    } on ApiServiceException {
      state = state.copyWith(
        status: CoursesResultListViewStatus.errorLoading,
      );
    }
  }

  Future<void> getStudentGPA({required String semester}) async {
    try {
      state = state.copyWith(
        status: CoursesResultListViewStatus.loading,
        studentGPA: null,
      );

      final studentGPA = await _apiService.getStudentGPA(
        semester: semester,
      );

      state = state.copyWith(
        status: CoursesResultListViewStatus.loaded,
        studentGPA: studentGPA,
      );
    } on ApiServiceException {
      state = state.copyWith(
        status: CoursesResultListViewStatus.errorLoading,
        studentGPA: null,
      );
    }
  }
}
