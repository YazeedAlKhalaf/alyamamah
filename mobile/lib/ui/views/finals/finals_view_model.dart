import 'package:alyamamah/core/models/final_exam.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/ui/views/finals/finals_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final finalsViewModelProvider =
    StateNotifierProvider<FinalsViewModel, FinalsState>(
  (ref) => FinalsViewModel(
    apiService: ref.read(apiServiceProvider),
  ),
);

class FinalsViewModel extends StateNotifier<FinalsState> {
  final _log = Logger('FinalsViewModel');

  final ApiService _apiService;

  FinalsViewModel({
    required ApiService apiService,
  })  : _apiService = apiService,
        super(const FinalsState());

  Future<void> getFinalExams() async {
    state = state.copyWith(status: FinalsStatus.loadingFinals);

    try {
      final finals = await _apiService.getFinalExams();

      finals.sort((a, b) => a.examDate.compareTo(b.examDate));

      state = state.copyWith(
        status: FinalsStatus.loadedFinals,
        finals: finals,
      );
    } catch (e) {
      _log.severe('failed to get finals', e);
      state = state.copyWith(status: FinalsStatus.errorLoadingFinals);
    }
  }

  DateTime get firstExamDate {
    if (state.finals.isEmpty) return DateTime.now();
    return state.finals
        .map((e) => e.examDate)
        .reduce((a, b) => a.isBefore(b) ? a : b);
  }

  DateTime get lastExamDate {
    if (state.finals.isEmpty) return DateTime.now();
    return state.finals
        .map((e) => e.examDate)
        .reduce((a, b) => a.isAfter(b) ? a : b);
  }

  List<FinalExam> getExamsForDate(DateTime date) {
    return state.finals
        .where((exam) =>
            exam.examDate.year == date.year &&
            exam.examDate.month == date.month &&
            exam.examDate.day == date.day)
        .toList();
  }

  bool hasExamOnDate(DateTime date) {
    return state.finals.any((exam) =>
        exam.examDate.year == date.year &&
        exam.examDate.month == date.month &&
        exam.examDate.day == date.day);
  }

  void toggleShowEndedExams() {
    state = state.copyWith(showEndedExams: !state.showEndedExams);
  }
}
