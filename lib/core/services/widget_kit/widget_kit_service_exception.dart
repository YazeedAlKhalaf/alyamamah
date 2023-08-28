enum WidgetKitServiceExceptionType {
  unknown,
  failedToReloadWidget,
  failedToSaveWidgetData,
  failedToDeleteWidgetData,
}

class WidgetKitServiceException implements Exception {
  final WidgetKitServiceExceptionType type;

  const WidgetKitServiceException([
    this.type = WidgetKitServiceExceptionType.unknown,
  ]);

  @override
  String toString() => 'WidgetKitServiceException(type: $type)';
}
