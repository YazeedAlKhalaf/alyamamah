import 'package:alyamamah/gen/proto/feedback.pbgrpc.dart';
import 'package:alyamamah/ui/views/feedback/models/feedback_body.dart';
import 'package:alyamamah/ui/views/feedback/models/feedback_category_formz.dart';
import 'package:alyamamah/ui/views/feedback/models/feedback_title.dart';
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
  final FeedbackTitle title;
  final FeedbackBody body;
  final FormzFeedbackCategory category;
  final bool validateOnUserInteraction;
  final bool shareMyContactInformation;

  FeedbackState({
    this.status = FeedbackStatus.unknown,
    this.categories = const [],
    this.title = const FeedbackTitle.pure(),
    this.body = const FeedbackBody.pure(),
    this.category = const FormzFeedbackCategory.pure(),
    this.validateOnUserInteraction = false,
    this.shareMyContactInformation = true,
  });

  FeedbackState copyWith({
    FeedbackStatus? status,
    List<FeedbackCategory>? categories,
    FeedbackTitle? title,
    FeedbackBody? body,
    FormzFeedbackCategory? category,
    bool? validateOnUserInteraction,
    bool? shareMyContactInformation,
  }) {
    return FeedbackState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      title: title ?? this.title,
      body: body ?? this.body,
      category: category ?? this.category,
      validateOnUserInteraction:
          validateOnUserInteraction ?? this.validateOnUserInteraction,
      shareMyContactInformation:
          shareMyContactInformation ?? this.shareMyContactInformation,
    );
  }

  @override
  bool operator ==(covariant FeedbackState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.categories, categories) &&
        other.title == title &&
        other.body == body &&
        other.category == category &&
        other.validateOnUserInteraction == validateOnUserInteraction &&
        other.shareMyContactInformation == shareMyContactInformation;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        categories.hashCode ^
        title.hashCode ^
        body.hashCode ^
        category.hashCode ^
        validateOnUserInteraction.hashCode ^
        shareMyContactInformation.hashCode;
  }
}
