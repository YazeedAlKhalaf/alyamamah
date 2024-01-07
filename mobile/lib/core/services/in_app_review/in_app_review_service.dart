import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:logging/logging.dart';

final inAppReviewServiceProvider = Provider(
  (ref) => InAppReviewService(
    inAppReview: InAppReview.instance,
  ),
);

class InAppReviewService {
  final _log = Logger('InAppReviewService');

  final InAppReview _inAppReview;

  InAppReviewService({
    required InAppReview inAppReview,
  }) : _inAppReview = inAppReview;

  Future<void> requestReview() async {
    try {
      if (await _inAppReview.isAvailable()) {
        await _inAppReview.requestReview();
      }
    } catch (e) {
      _log.severe('Failed to request review: $e');
    }
  }
}
