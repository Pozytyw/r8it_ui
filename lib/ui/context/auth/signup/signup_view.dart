import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/widget/error.dart';
import 'package:r8it/ui/widget/spacing.dart';
import 'package:r8it/ui/widget/page.dart';

class SignupForm {
  VoidCallback submitCallback;
  TextEditingController emailEditingController;
  String? emailValidationMessage;
  TextEditingController passwordEditingController;
  String? passwordValidationMessage;
  TextEditingController passwordConfirmEditingController;
  String? passwordConfirmValidationMessage;
  String? globalErrorMessage;

  SignupForm(
    this.submitCallback,
    this.emailEditingController,
    this.emailValidationMessage,
    this.passwordEditingController,
    this.passwordValidationMessage,
    this.passwordConfirmEditingController,
    this.passwordConfirmValidationMessage,
    this.globalErrorMessage,
  );
}

class SignupView extends StatelessWidget {
  final SignupForm _signupForm;

  const SignupView(this._signupForm, {super.key});

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
              controller: _signupForm.emailEditingController,
              autocorrect: false,
              decoration: InputDecoration(
                label: Text(l10n.emailFieldLabel),
                errorText: _signupForm.emailValidationMessage,
              ),
            ),
            TextField(
              controller: _signupForm.passwordEditingController,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                label: Text(l10n.passwordFieldLabel),
                errorText: _signupForm.passwordValidationMessage,
              ),
            ),
            TextField(
              controller: _signupForm.passwordConfirmEditingController,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                label: Text(l10n.passwordConfirmFieldLabel),
                errorText: _signupForm.passwordConfirmValidationMessage,
              ),
            ),
            ErrorMessageWidget(_signupForm.globalErrorMessage),
            Padding(
              padding: SpacingProvider.paddingTop1x,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => GoRouter.of(context).goNamed(AppRouter.loginPageName),
                    child: Text(l10n.loginRedirectButton),
                  ),
                  ElevatedButton(
                    onPressed: _signupForm.submitCallback,
                    child: Text(l10n.signupPageButton),
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
