import 'package:alyamamah/core/providers/feedback_client/feedback_client_provider.dart';
import 'package:alyamamah/core/repository/feedback/feedback_respoitory_exception.dart';
import 'package:alyamamah/gen/proto/feedback.pbgrpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';

final feedbackRepositoryProvider = Provider<FeedbackRepository>(
  (ref) => FeedbackRepository(
    feedbackClient: ref.watch(feedbackClientProvider),
  ),
);

class FeedbackRepository {
  final _log = Logger('FeedbackRepository');

  final FeedbackClient _feedbackClient;

  FeedbackRepository({
    required FeedbackClient feedbackClient,
  }) : _feedbackClient = feedbackClient;

  Future<GetFeedbackCategoriesResponse> getFeedbackCategories() async {
    try {
      final request = GetFeedbackCategoriesRequest();

      final resp = await _feedbackClient.getFeedbackCategories(request);

      return resp;
    } on GrpcError catch (e) {
      _log.severe('Failed to get feedback categories', e);

      throw FeedbackRepositoryException();
    }
  }

  Future<CreateFeedbackResponse> createFeedback({
    required String title,
    required String body,
    required String categoryId,
  }) async {
    try {
      final request = CreateFeedbackRequest(
        title: title,
        body: body,
        categoryId: categoryId,
      );

      final resp = await _feedbackClient.createFeedback(request);

      return resp;
    } on GrpcError catch (e) {
      _log.severe('Failed to create feedback', e);

      throw FeedbackRepositoryException();
    }
  }

  Future<GetFeedbackResponse> getFeedback({
    required GetFeedbackRequest request,
  }) async {
    try {
      final resp = await _feedbackClient.getFeedback(request);

      return resp;
    } on GrpcError catch (e) {
      _log.severe('Failed to get feedback', e);

      throw FeedbackRepositoryException();
    }
  }
}
