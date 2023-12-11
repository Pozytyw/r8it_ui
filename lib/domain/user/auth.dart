class RegisterRequest {
  String email;
  String username;
  String password;

  RegisterRequest({
    required this.email,
    required this.username,
    required this.password,
  });
}

class RegisterOtpRequest {
  String email;
  String otp;

  RegisterOtpRequest({
    required this.email,
    required this.otp,
  });
}

class LoginRequest {
  String email;
  String password;

  LoginRequest({
    required this.email,
    required this.password,
  });
}
