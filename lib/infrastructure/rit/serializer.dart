import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:r8it/exception/service_exception.dart';
import 'package:r8it/infrastructure/rit/exception_response_dto.dart';

String encodeRequest(Object? request) {
  return jsonEncode(request);
}

T decodeResponse<T>(
    Response response, T Function(Map<String, dynamic>) decoder) {
  if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
    return decoder(response.data);
  }

  throw _tryDecodeError(response.data);
}

errorCheck(Response response) {
  if (response.statusCode == 200) {
    return;
  }
  throw _tryDecodeError(response.data);
}

Exception _tryDecodeError(responseData) {
  String? code;
  String? message;
  Map<String, String>? fieldConstraintViolation;
  String? exceptionUuid;
  String? detailedMessage;

  if (responseData is String) {
    message = responseData;
  }

  if (responseData is Map<String, dynamic>) {
    var errorBody = ExceptionResponseDTO.fromJson(responseData);
    message = errorBody.message;
    code = errorBody.code;
    fieldConstraintViolation = errorBody.fieldConstraintViolation;
    exceptionUuid = errorBody.uuid;
  }

  detailedMessage = 'Receive response with type[${responseData.runtimeType}], '
      'code: [$code],'
      'exceptionUuid: [$exceptionUuid],'
      'fieldConstraintViolation: [$fieldConstraintViolation],'
      'decoded message: [$message]';

  return ServiceException(
    code: code ?? '000',
    message: message ?? 'Could not read http response',
    fieldConstraintViolation: fieldConstraintViolation,
    exceptionUuid: exceptionUuid,
    detailedMessage: detailedMessage,
  );
}
