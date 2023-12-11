import 'package:r8it/domain/user/auth.dart';
import 'package:r8it/domain/user/info.dart';
import 'package:r8it/infrastructure/rit/bearer_auth.dart';
import 'package:r8it/infrastructure/rit/exception_handler.dart';
import 'package:rit_client/rit_client.dart';

class RitRestClient {
  static const String basePath = r'https://api.rookiebyte.pl';

  late final RitClient _ritClient;
  final BearerAuthInterceptor _bearerAuthInterceptor = BearerAuthInterceptor();

  RitRestClient() {
    _ritClient = RitClient(
      basePathOverride: basePath,
      interceptors: [
        _bearerAuthInterceptor,
        ExceptionHandlerInterceptor(),
      ],
    );
  }

  void setBearerAuth(String? token) {
    _bearerAuthInterceptor.token = token;
  }

  Future<User> userInfo() {
    return _ritClient
        .getUserInfoEndpointApi()
        .userInfo1()
        .then((r) => r.data!)
        .then(
          (info) => User(
            username: info.username,
            email: info.email,
          ),
        );
  }

  Future<String> login(LoginRequest form) {
    return _ritClient
        .getAuthEndpointApi()
        .login(
          loginRequestDTO: LoginRequestDTO(
            email: form.email,
            password: form.password,
          ),
        )
        .then((r) => r.data!.jwt);
  }

  Future<void> registerInit(RegisterRequest request) {
    return _ritClient.getAuthEndpointApi().registerInit(
          registerRequestDTO: RegisterRequestDTO(
            email: request.email,
            username: request.username,
            password: request.password,
          ),
        );
  }

  Future<String> registerConfirm(RegisterOtpRequest request) {
    return _ritClient
        .getAuthEndpointApi()
        .userRegisterConfirmOtp(
          registerOtpRequestDTO: RegisterOtpRequestDTO(
            email: request.email,
            otp: request.otp,
          ),
        )
        .then((r) => r.data!.jwt);
  }
}
