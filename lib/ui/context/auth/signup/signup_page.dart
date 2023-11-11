import 'package:flutter/material.dart';
import 'package:r8it/storage/vault.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/context/auth/signup/otp_view.dart';
import 'package:r8it/ui/context/auth/signup/signup_view.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final SignupForm _signupForm = SignupForm(_sentOtp);
  late final SignupOtpForm _signupOtpForm = SignupOtpForm(_verifyOtp);
  String? _recipient;

  @override
  Widget build(BuildContext context) {
    if (_recipient?.isNotEmpty ?? false) {
      _signupOtpForm.recipient = _recipient;
      return SignupOtpView(_signupOtpForm);
    }
    return SignupView(_signupForm);
  }

  void _sentOtp(BuildContext context) {
    if (_signupForm.passwordEditingController.value.text.isEmpty ||
        _signupForm.emailEditingController.value.text.isEmpty) {
      setState(() {
        _signupForm.phoneValidationMessage = 'Testowy';
        _signupForm.emailValidationMessage = 'Testowy';
        _signupForm.passwordValidationMessage = 'Testowy';
        _signupForm.globalErrorMessage = 'Testowy';
        _signupForm.passwordEditingController.clear();
      });
      return;
    }
    setState(() {
      _signupForm.phoneValidationMessage = null;
      _signupForm.emailValidationMessage = null;
      _signupForm.passwordValidationMessage = null;
      _signupForm.globalErrorMessage = null;
      _recipient = _signupForm.emailEditingController.text;
    });
  }

  void _verifyOtp(BuildContext context, String value) {
    if (value.isEmpty) {
      setState(() {
        _signupOtpForm.globalErrorMessage = 'Test';
      });
      return;
    }
    setState(() {
      _signupOtpForm.globalErrorMessage = null;
    });
    Vault.instance()
        .then((v) => v.setAuthToken("bleble"))
        .then((value) => AppRouter.goHomePage(context));
  }
}
