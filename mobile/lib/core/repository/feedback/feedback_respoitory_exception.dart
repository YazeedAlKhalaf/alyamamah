enum FeedbackRepositoryExceptionType {
  unknown,
}

class FeedbackRepositoryException implements Exception {
  final FeedbackRepositoryExceptionType type;

  FeedbackRepositoryException([
    this.type = FeedbackRepositoryExceptionType.unknown,
  ]);

  @override
  String toString() => 'FeedbackRepositoryException(type: $type)';
}
