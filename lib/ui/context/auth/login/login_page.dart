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
    if (_loginForm.passwordEditingController.value.text.isEmpty || _loginForm.phoneEditingController.value.text.isEmpty) {
      setState(() {
        _loginForm.phoneValidationMessage  = 'Testowy';
        _loginForm.passwordValidationMessage  = 'Testowy';
        _loginForm.globalErrorMessage  = 'Testowy';
        _loginForm.passwordEditingController.clear();
      });
      return;
    }
    setState(() {
      _loginForm.phoneValidationMessage = null;
      _loginForm.passwordValidationMessage = null;
      _loginForm.globalErrorMessage = null;
    });
  }
}
