import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r8it/infrastructure/rit/api.dart';
import 'package:r8it/infrastructure/rit/model/login_request_dto.dart';

void main() {
  test('test headers', () async {
    var dio = Dio(BaseOptions(
      baseUrl: r'https://localhost:8084',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ));
    var rit = R8it(dio: dio);
    var response = await rit.getAuthEndpointApi().login(
      loginRequestDTO: LoginRequestDTO(email: r'test@example.com', password: r'password'),
    );
    expect(1, 0);
  });
}
