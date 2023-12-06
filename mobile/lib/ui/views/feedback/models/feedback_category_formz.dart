import 'package:alyamamah/gen/proto/feedback.pb.dart';
import 'package:formz/formz.dart';

enum FeedbackCategoryValidationError { empty }

class FormzFeedbackCategory
    extends FormzInput<FeedbackCategory?, FeedbackCategoryValidationError> {
  const FormzFeedbackCategory.pure() : super.pure(null);

  const FormzFeedbackCategory.dirty({FeedbackCategory? value})
      : super.dirty(value);

  @override
  FeedbackCategoryValidationError? validator(FeedbackCategory? value) {
    if (value == null) {
      return FeedbackCategoryValidationError.empty;
    }

    return null;
  }
}
