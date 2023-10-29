import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:r8it/storage/vault.dart';
import 'package:r8it/ui/context/auth/login/login_page.dart';
import 'package:r8it/ui/context/auth/signup/signup_page.dart';

class AppRouter {
  static const homePageName = 'homePage';
  static const loginPageName = 'loginPage';
  static const signupPageName = 'signupPage';

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          name: homePageName,
          path: '/',
          builder: (context, state) => const Placeholder(),
          redirect: (context, state) => authCheck()),
      GoRoute(
        name: loginPageName,
        path: '/auth/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: signupPageName,
        path: '/auth/signup',
        builder: (context, state) => const SignupPage(),
      ),
    ],
  );

  static Future<String?> authCheck() {
    return Vault.instance().then((v) => v.isTokenAccessible() ? null : "/auth/login");
  }
}
