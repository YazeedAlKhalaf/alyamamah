import 'package:alyamamah/core/repository/feedback/feedback_repository.dart';
import 'package:alyamamah/core/repository/feedback/feedback_respoitory_exception.dart';
import 'package:alyamamah/gen/proto/feedback.pb.dart';
import 'package:alyamamah/ui/views/feedback/feedback_state.dart';
import 'package:alyamamah/ui/views/feedback/models/feedback_body.dart';
import 'package:alyamamah/ui/views/feedback/models/feedback_category_formz.dart';
import 'package:alyamamah/ui/views/feedback/models/feedback_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final feedbackViewModelProvider =
    StateNotifierProvider.autoDispose<FeedbackViewModel, FeedbackState>(
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

  void onTitleChanged(String value) {
    final FeedbackTitle title;
    if (state.validateOnUserInteraction) {
      title = FeedbackTitle.dirty(value: value);
    } else {
      title = FeedbackTitle.pure(value: value);
    }

    state = state.copyWith(
      title: title,
    );
  }

  void onBodyChanged(
    String value,
  ) {
    final FeedbackBody body;
    if (state.validateOnUserInteraction) {
      body = FeedbackBody.dirty(value: value);
    } else {
      body = FeedbackBody.pure(value: value);
    }

    state = state.copyWith(
      body: body,
    );
  }

  void onCategoryChanged(FeedbackCategory? value) {
    state = state.copyWith(
      category: FormzFeedbackCategory.dirty(value: value),
    );
  }

  void onShareMyContactInformationChanged(bool? value) {
    state = state.copyWith(
      shareMyContactInformation: value,
    );
  }

  Future<void> sendFeedback({
    required String studentId,
    required String studentName,
    required String studentEmail,
    required String studentPhone,
  }) async {
    if (state.status == FeedbackStatus.sendingFeedback) {
      return;
    }

    final title = state.title;
    final body = state.body;
    final category = state.category;

    if (title.isNotValid || body.isNotValid || category.isNotValid) {
      state = state.copyWith(
        validateOnUserInteraction: true,
        title: FeedbackTitle.dirty(value: title.value),
        body: FeedbackBody.dirty(value: body.value),
        category: FormzFeedbackCategory.dirty(value: category.value),
      );
      return;
    }

    try {
      state = state.copyWith(
        status: FeedbackStatus.sendingFeedback,
      );

      if (!state.shareMyContactInformation) {
        studentId = '';
        studentName = '';
        studentEmail = '';
        studentPhone = '';
      }

      await _feedbackRepository.createFeedback(
        title: title.value,
        body: body.value,
        categoryId: category.value?.id ?? state.categories.first.id,
        studentId: studentId,
        studentName: studentName,
        studentEmail: studentEmail,
        studentPhone: studentPhone,
      );

      state = state.copyWith(
        status: FeedbackStatus.sentFeedback,
      );
    } on FeedbackRepositoryException catch (e) {
      _log.severe('failed to submit feedback', e);

      state = state.copyWith(
        status: FeedbackStatus.errorSendingFeedback,
      );
    }
  }
}
