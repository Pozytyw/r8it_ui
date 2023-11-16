import 'dart:async';

import 'package:dio/dio.dart';
import 'package:r8it/infrastructure/rit/api.dart';
import 'package:r8it/infrastructure/rit/model/login_request_dto.dart';
import 'package:r8it/infrastructure/rit/model/login_response_dto.dart';
import 'package:r8it/infrastructure/rit/serializer.dart';

class AuthEndpointApi {
  final Dio _dio;

  const AuthEndpointApi(this._dio);

  Future<LoginResponseDTO> login({
    required LoginRequestDTO loginRequestDTO,
  }) async {
    const path = r'/v1/rit/users/auth/login';
    final options = Options(method: HttpMethod.post);

    final response = await _dio.request<Object>(
      path,
      data: encodeRequest(loginRequestDTO),
      options: options,
    );

    return decodeResponse(response, LoginResponseDTO.fromJson);
  }
}
