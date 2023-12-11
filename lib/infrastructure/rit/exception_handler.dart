import 'package:dio/dio.dart';
import 'package:r8it/exception/service_exception.dart';
import 'package:r8it/infrastructure/rit/exception_response_dto.dart';

class ExceptionHandlerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    var response = err.response;
    if (response?.statusCode != 200) {
      throw _tryDecodeError(response?.data);
    }
    super.onError(err, handler);
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

    detailedMessage =
        'Receive response with type[${responseData.runtimeType}], '
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
}
