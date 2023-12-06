import 'package:alyamamah/gen/proto/feedback.pbgrpc.dart';
import 'package:flutter/foundation.dart';

enum FeedbackStatus {
  unknown,
  loadingCategories,
  loadedCategories,
  errorLoadingCategories,
  sendingFeedback,
  sentFeedback,
  errorSendingFeedback,
}

class FeedbackState {
  final FeedbackStatus status;
  final List<FeedbackCategory> categories;

  FeedbackState({
    this.status = FeedbackStatus.unknown,
    this.categories = const [],
  });

  FeedbackState copyWith({
    FeedbackStatus? status,
    List<FeedbackCategory>? categories,
  }) {
    return FeedbackState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }

  @override
  bool operator ==(covariant FeedbackState other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.categories, categories);
  }

  @override
  int get hashCode => status.hashCode ^ categories.hashCode;
}
