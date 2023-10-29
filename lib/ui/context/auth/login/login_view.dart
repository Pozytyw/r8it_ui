import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/widget/error.dart';
import 'package:r8it/ui/widget/spacing.dart';
import 'package:r8it/ui/widget/page.dart';

class LoginForm {
  VoidCallback submitCallback;
  TextEditingController emailEditingController;
  String? emailValidationMessage;
  TextEditingController passwordEditingController;
  String? passwordValidationMessage;
  String? globalErrorMessage;

  LoginForm(
    this.submitCallback,
    this.emailEditingController,
    this.emailValidationMessage,
    this.passwordEditingController,
    this.passwordValidationMessage,
    this.globalErrorMessage,
  );
}

class LoginView extends StatelessWidget {
  final LoginForm _loginForm;

  const LoginView(this._loginForm, {super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    return AppPage(
      body: Padding(
        padding: SpacingProvider.paddingAll2x,
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: SpacingProvider.singleSpacingValue,
          children: [
            TextField(
              controller: _loginForm.emailEditingController,
              autocorrect: false,
              decoration: InputDecoration(
                label: Text(l10n.emailFieldLabel),
                errorText: _loginForm.emailValidationMessage,
              ),
            ),
            TextFormField(
              controller: _loginForm.passwordEditingController,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                label: Text(l10n.passwordFieldLabel),
                errorText: _loginForm.passwordValidationMessage,
              ),
            ),
            ErrorMessageWidget(_loginForm.globalErrorMessage),
            Padding(
              padding: SpacingProvider.paddingTop1x,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => GoRouter.of(context).goNamed(AppRouter.signupPageName),
                    child: Text(l10n.signupRedirectButton),
                  ),
                  ElevatedButton(
                    onPressed: _loginForm.submitCallback,
                    child: Text(l10n.loginPageButton),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
