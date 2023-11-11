import 'package:flutter/material.dart';
import 'package:r8it/storage/vault.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/context/auth/login/login_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginForm _loginForm = LoginForm(_login);

  @override
  Widget build(BuildContext context) {
    return LoginView(_loginForm);
  }

  void _login(BuildContext context) {
    if (_loginForm.passwordEditingController.value.text.isEmpty ||
        _loginForm.emailEditingController.value.text.isEmpty) {
      setState(() {
        _loginForm.emailValidationMessage = 'Testowy';
        _loginForm.passwordValidationMessage = 'Testowy';
        _loginForm.globalErrorMessage = 'Testowy';
        _loginForm.passwordEditingController.clear();
      });
      return;
    }
    setState(() {
      _loginForm.emailValidationMessage = null;
      _loginForm.passwordValidationMessage = null;
      _loginForm.globalErrorMessage = null;
    });
    Vault.instance()
        .then((v) => v.setAuthToken("bleble"))
        .then((value) => AppRouter.goHomePage(context));
  }
}
