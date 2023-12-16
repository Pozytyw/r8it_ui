import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:r8it/storage/vault.dart';
import 'package:r8it/ui/context/add/add_page.dart';
import 'package:r8it/ui/context/auth/login/login_page.dart';
import 'package:r8it/ui/context/auth/signup/signup_page.dart';
import 'package:r8it/ui/context/home/home_view.dart';
import 'package:r8it/ui/context/profile/profile_view.dart';

class AppRouter {
  static const _homePageName = 'homePage';
  static const _navigationPageName = 'navigationPage';
  static const _addPageName = 'addPage';
  static const _profilePageName = 'profilePage';
  static const _notificationsPageName = 'notificationsPage';
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
        name: _navigationPageName,
        path: '/navigation',
        builder: (context, state) => const HomeView(),
        redirect: (context, state) => authCheck(),
      ),
      GoRoute(
        name: _addPageName,
        path: '/add_post',
        builder: (context, state) => const AddPage(),
        redirect: (context, state) => authCheck(),
      ),
      GoRoute(
        name: _profilePageName,
        path: '/profile',
        builder: (context, state) => const ProfileView(),
        redirect: (context, state) => authCheck(),
      ),
      GoRoute(
        name: _notificationsPageName,
        path: '/notifications',
        builder: (context, state) => const HomeView(),
        redirect: (context, state) => authCheck(),
      ),
      GoRoute(
        name: _loginPageName,
        path: '/auth/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: _signupPageName,
        path: '/auth/signup',
        builder: (context, state) => const SignupPage(),
      )
    ],
  );

  static void goHomePage(BuildContext context) {
    GoRouter.of(context).goNamed(_homePageName);
  }

  static void goNavigationPage(BuildContext context) {
    GoRouter.of(context).goNamed(_navigationPageName);
  }

  static void goAddPage(BuildContext context) {
    GoRouter.of(context).goNamed(_addPageName);
  }

  static void goProfilePage(BuildContext context) {
    GoRouter.of(context).goNamed(_profilePageName);
  }

  static void goNotificationsPage(BuildContext context) {
    GoRouter.of(context).goNamed(_notificationsPageName);
  }

  static void goLoginPageName(BuildContext context) {
    GoRouter.of(context).goNamed(_loginPageName);
  }

  static void goSignupPageName(BuildContext context) {
    GoRouter.of(context).goNamed(_signupPageName);
  }

  static int pageIndex(BuildContext context) {
    var name = ModalRoute.of(context)?.settings.name;
    int value = 0;
    switch (name) {
      case _navigationPageName:
        value = 1;
      case _addPageName:
        value = 2;
      case _profilePageName:
        value = 3;
      case _notificationsPageName:
        value = 4;
    }
    return value;
  }

  static Future<String?> authCheck() {
    return Vault.instance()
        .then((v) => v.isTokenAccessible() ? null : "/auth/login");
  }
}
