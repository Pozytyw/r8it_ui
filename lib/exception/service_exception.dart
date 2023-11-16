class ServiceException implements Exception {
  final String code;
  final String message;
  final Map<String, String>? fieldConstraintViolation;
  final String? exceptionUuid;
  final String detailedMessage;

  ServiceException({
    required this.code,
    required this.message,
    this.fieldConstraintViolation,
    this.exceptionUuid,
    required this.detailedMessage,
  });

  @override
  String toString() {
    return '''ServiceException[
    code: $code,
    message: $message,
    fieldConstraintViolation: $fieldConstraintViolation,
    exceptionUuid: $exceptionUuid,
    detailedMessage: $detailedMessage,
    ]''';
  }
}
