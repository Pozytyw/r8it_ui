import 'package:flutter/material.dart';
import 'package:r8it/ui/context/auth/login/login_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginForm _loginForm;

  _LoginPageState() {
    _loginForm = LoginForm(
      _login,
      TextEditingController(),
      null,
      TextEditingController(),
      null,
      null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(_loginForm);
  }

  void _login() {
    setState(() {
      _loginForm.emailValidationMessage  = 'Testowy';
      _loginForm.passwordValidationMessage  = 'Testowy';
      _loginForm.globalErrorMessage  = 'Testowy';
      _loginForm.passwordEditingController.clear();
    });
  }
}
