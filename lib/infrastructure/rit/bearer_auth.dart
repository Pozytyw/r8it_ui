import 'package:dio/dio.dart';

class BearerAuthInterceptor extends Interceptor {
  String? _token;

  set token(String? value) {
    _token = value;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_token?.isNotEmpty == true) {
      options.headers['Authorization'] = 'Bearer $_token';
    }
    super.onRequest(options, handler);
  }
}
