import 'package:formz/formz.dart';

enum FeedbackTitleValidationError {
  empty,
  lessThanThreeCharacters,
  moreThanOneHundredCharacters,
}

class FeedbackTitle extends FormzInput<String, FeedbackTitleValidationError> {
  const FeedbackTitle.pure({String value = ''}) : super.pure(value);

  const FeedbackTitle.dirty({String value = ''}) : super.dirty(value);

  @override
  FeedbackTitleValidationError? validator(String value) {
    if (value.isEmpty) {
      return FeedbackTitleValidationError.empty;
    }

    if (value.length < 3) {
      return FeedbackTitleValidationError.lessThanThreeCharacters;
    }

    if (value.length > 100) {
      return FeedbackTitleValidationError.moreThanOneHundredCharacters;
    }

    return null;
  }
}
