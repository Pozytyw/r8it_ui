import 'package:dio/dio.dart';

class RitInterceptor implements Interceptor {

  static const restContentType = r'application/json';

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.validateStatus = (it) => true;
    options.contentType = restContentType;
    /*todo: auth token*/
    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
