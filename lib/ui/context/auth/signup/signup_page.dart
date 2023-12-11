import 'package:flutter/material.dart';
import 'package:r8it/domain/rit_repository.dart';
import 'package:r8it/domain/user/auth.dart';
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
  _PageMode _pageMode = _PageMode.signup;

  @override
  Widget build(BuildContext context) {
    if (_pageMode == _PageMode.signup) {
      return SignupView(_signupForm);
    }
    _signupOtpForm.recipient = _signupForm.email;
    return SignupOtpView(_signupOtpForm);
  }

  Future<void> _sentOtp(BuildContext context) {
    setState(() {
      _signupForm.cleanErrorMessage();
    });
    var request = RegisterRequest(
      email: _signupForm.email,
      username: _signupForm.username,
      password: _signupForm.password,
    );
    return RitRepository.instance()
        .registerInit(request)
        .then(
          (it) => setState(() {
            _pageMode = _PageMode.otp;
          }),
        )
        .onError(_handleServiceException);
  }

  Future<void> _verifyOtp(BuildContext context) {
    setState(() {
      _signupOtpForm.cleanErrorMessage();
    });
    var request = RegisterOtpRequest(
      email: _signupOtpForm.email,
      otp: _signupOtpForm.otp,
    );
    return RitRepository.instance()
        .registerConfirm(request)
        .then((args) => AppRouter.goHomePage(context))
        .onError(_handleServiceException);
  }

  void _handleServiceException(error, stackTrace) {
    setState(() {
      if (_pageMode == _PageMode.signup) {
        _signupForm.fillErrorMessages(error);
        return;
      }
      _signupOtpForm.fillErrorMessages(error);
    });
  }
}

enum _PageMode { otp, signup }
