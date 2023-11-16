//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:r8it/infrastructure/rit/api/auth_endpoint_api.dart';

class R8it {
  final Dio dio;

  R8it({required this.dio}) {
    dio.interceptors.add(R8itInterceptor());
  }
  
  AuthEndpointApi getAuthEndpointApi() {
    return AuthEndpointApi(dio);
  }
}

class R8itInterceptor implements Interceptor {

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.validateStatus = (it) => true;
    /*todo: auth token*/
    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}

class HttpMethod {
  static const post = r'POST';
  static const get = r'GET';
  static const delete = r'DELETE';
}
