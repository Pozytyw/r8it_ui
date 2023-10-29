import 'package:flutter/material.dart';
import 'package:r8it/ui/context/auth/signup/signup_view.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final SignupForm _signupForm;

  _SignupPageState() {
    _signupForm = SignupForm(
      _signup,
      TextEditingController(),
      null,
      TextEditingController(),
      null,
      TextEditingController(),
      null,
      null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SignupView(_signupForm);
  }

  void _signup () {
    setState(() {
      _signupForm.emailValidationMessage = 'test';
      _signupForm.passwordValidationMessage = 'test';
      _signupForm.passwordConfirmValidationMessage = 'test';
      _signupForm.globalErrorMessage = 'test';
    });
  }
}
