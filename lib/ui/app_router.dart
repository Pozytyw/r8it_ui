import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:r8it/storage/vault.dart';
import 'package:r8it/ui/context/auth/login/login_page.dart';
import 'package:r8it/ui/context/home/home_view.dart';

class AppRouter {
  static const _homePageName = 'homePage';
  static const _loginPageName = 'loginPage';
  static const _signupPageName = 'signupPage';

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: _homePageName,
        path: '/',
        builder: (context, state) => const HomeView(),
        redirect: (context, state) => authCheck(),
      ),
      GoRoute(
        name: _loginPageName,
        path: '/auth/login',
        builder: (context, state) => const LoginPage(),
      )
    ],
  );

  static void goHomePage(BuildContext context) {
    GoRouter.of(context).goNamed(_homePageName);
  }

  static Future<String?> authCheck() {
    return Vault.instance()
        .then((v) => v.isTokenAccessible() ? null : "/auth/login");
  }
}
