import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:r8it/domain/rit_repository.dart';
import 'package:r8it/domain/user/auth.dart';
import 'package:r8it/exception/service_exception.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/context/auth/login/login_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginFormController _controller = LoginFormController(_login);

  @override
  Widget build(BuildContext context) {
    return LoginView(_controller);
  }

  Future<void> _login(BuildContext context) {
    var request = LoginRequest(
      email: _controller.emailEditingController.text,
      password: _controller.passwordEditingController.text,
    );

    return RitRepository.instance()
        .login(request)
        .onError((error, stackTrace) => handleError(error))
        .then((args) => AppRouter.goHomePage(context));
  }

  void handleError(error) {
    if (error is ServiceException) {
      handleServiceException(error);
      return;
    }
    if (error is DioException &&
        error.error != null &&
        error.error is ServiceException) {
      handleServiceException(error.error as ServiceException);
    }
  }

  void handleServiceException(ServiceException error) {
    setState(() {
      /*todo translate by code*/
      _controller.emailValidationMessage =
          error.fieldConstraintViolation?['email'];
      _controller.passwordValidationMessage =
          error.fieldConstraintViolation?['password'];
      /*todo translate by code*/
      _controller.globalErrorMessage = error.code;
    });
  }
}
