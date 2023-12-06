import 'package:alyamamah/core/repository/feedback/feedback_repository.dart';
import 'package:alyamamah/core/repository/feedback/feedback_respoitory_exception.dart';
import 'package:alyamamah/ui/views/feedback/feedback_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final feedbackViewModelProvider =
    StateNotifierProvider<FeedbackViewModel, FeedbackState>(
  (ref) => FeedbackViewModel(
    feedbackRepository: ref.read(feedbackRepositoryProvider),
  ),
);

class FeedbackViewModel extends StateNotifier<FeedbackState> {
  final _log = Logger('FeedbackViewModel');

  final FeedbackRepository _feedbackRepository;

  FeedbackViewModel({
    required FeedbackRepository feedbackRepository,
  })  : _feedbackRepository = feedbackRepository,
        super(FeedbackState());

  Future<void> getFeedbackCategories() async {
    try {
      state = state.copyWith(
        status: FeedbackStatus.loadingCategories,
      );

      final resp = await _feedbackRepository.getFeedbackCategories();

      state = state.copyWith(
        status: FeedbackStatus.loadedCategories,
        categories: resp.categories,
      );
    } on FeedbackRepositoryException catch (e) {
      _log.severe('failed to get feedback categories', e);

      state = state.copyWith(
        status: FeedbackStatus.errorLoadingCategories,
        categories: [],
      );
    }
  }
}
