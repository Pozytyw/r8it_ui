import 'package:flutter/material.dart';
import 'package:r8it/domain/rit_repository.dart';
import 'package:r8it/domain/user/auth.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/context/auth/login/login_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginForm _form = LoginForm(_login);

  @override
  Widget build(BuildContext context) {
    return LoginView(_form);
  }

  Future<void> _login(BuildContext context) {
    setState(() {
      _form.cleanErrorMessage();
    });
    var request = LoginRequest(email: _form.email, password: _form.password);
    return RitRepository.instance()
        .login(request)
        .then((args) => AppRouter.goHomePage(context))
        .onError(_handleServiceException);
  }

  void _handleServiceException(error, stackTrace) {
    setState(() {
      _form.fillErrorMessages(error);
    });
  }
}
