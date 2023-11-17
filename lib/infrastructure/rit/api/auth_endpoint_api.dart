//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:r8it/infrastructure/rit/serializer.dart';
import 'package:dio/dio.dart';

import 'package:r8it/infrastructure/rit/model/login_request_dto.dart';
import 'package:r8it/infrastructure/rit/model/login_response_dto.dart';
import 'package:r8it/infrastructure/rit/model/register_otp_request_dto.dart';
import 'package:r8it/infrastructure/rit/model/register_request_dto.dart';

class AuthEndpointApi {

  final Dio _dio;

  const AuthEndpointApi(this._dio);

  /// login
  /// 
  ///
  /// Parameters:
  /// * [loginRequestDTO] 
  ///
  /// Returns a [Future] containing a [Response] with a [LoginResponseDTO] as data
  /// Throws [ServiceException] if API call or serialization fails
  Future<LoginResponseDTO> login({ 
    required LoginRequestDTO loginRequestDTO,
  }) async {
    final path = r'/v1/rit/users/auth/login';
    final options = Options(
      method: r'POST',
      contentType: 'application/json',
    );

    Map<String, dynamic>? queryParameters;

    dynamic bodyData;
    bodyData=encodeRequest(loginRequestDTO);

    final response = await _dio.request<Object>(
      path,
      data: bodyData,
      queryParameters: queryParameters,
      options: options
    );
    return decodeResponse(response, LoginResponseDTO.fromJson);
  }

  /// registerInit
  /// 
  ///
  /// Parameters:
  /// * [registerRequestDTO] 
  ///
  /// Returns a [Future]
  /// Throws [ServiceException] if API call or serialization fails
  Future<void> registerInit({ 
    required RegisterRequestDTO registerRequestDTO,
  }) async {
    final path = r'/v1/rit/users/auth/register';
    final options = Options(
      method: r'POST',
      contentType: 'application/json',
    );

    Map<String, dynamic>? queryParameters;

    dynamic bodyData;
    bodyData=encodeRequest(registerRequestDTO);

    final response = await _dio.request<Object>(
      path,
      data: bodyData,
      queryParameters: queryParameters,
      options: options
    );
    
    return errorCheck(response);
  }

  /// userRegisterConfirmOtp
  /// 
  ///
  /// Parameters:
  /// * [registerOtpRequestDTO] 
  ///
  /// Returns a [Future] containing a [Response] with a [LoginResponseDTO] as data
  /// Throws [ServiceException] if API call or serialization fails
  Future<LoginResponseDTO> userRegisterConfirmOtp({ 
    required RegisterOtpRequestDTO registerOtpRequestDTO,
  }) async {
    final path = r'/v1/rit/users/auth/register/otp';
    final options = Options(
      method: r'POST',
      contentType: 'application/json',
    );

    Map<String, dynamic>? queryParameters;

    dynamic bodyData;
    bodyData=encodeRequest(registerOtpRequestDTO);

    final response = await _dio.request<Object>(
      path,
      data: bodyData,
      queryParameters: queryParameters,
      options: options
    );
    return decodeResponse(response, LoginResponseDTO.fromJson);
  }
}
