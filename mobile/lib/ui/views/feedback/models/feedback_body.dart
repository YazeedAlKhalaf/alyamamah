import 'package:formz/formz.dart';

enum FeedbackBodyValidationError {
  empty,
  lessThanTenCharacters,
  moreThanOneThousandCharacters,
}

class FeedbackBody extends FormzInput<String, FeedbackBodyValidationError> {
  const FeedbackBody.pure({String value = ''}) : super.pure(value);

  const FeedbackBody.dirty({String value = ''}) : super.dirty(value);

  @override
  FeedbackBodyValidationError? validator(String value) {
    if (value.isEmpty) {
      return FeedbackBodyValidationError.empty;
    }

    if (value.length < 10) {
      return FeedbackBodyValidationError.lessThanTenCharacters;
    }

    if (value.length > 1000) {
      return FeedbackBodyValidationError.moreThanOneThousandCharacters;
    }

    return null;
  }
}
