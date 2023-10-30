import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/ui/widget/error.dart';
import 'package:r8it/ui/widget/page.dart';
import 'package:r8it/ui/widget/size.dart';

class LoginForm {
  VoidCallback submitCallback;
  TextEditingController phoneEditingController;
  String? phoneValidationMessage;
  TextEditingController passwordEditingController;
  String? passwordValidationMessage;
  String? globalErrorMessage;

  LoginForm(
    this.submitCallback,
    this.phoneEditingController,
    this.phoneValidationMessage,
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
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return AppPage(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(l10n.loginWelcomeMessage,
                style: const TextStyle(
                  fontSize: SizeProvider.h1,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              l10n.loginMessage,
              style: const TextStyle(fontSize: SizeProvider.small),
            ),
            const SizedBox(height: 64),
            Container(
              decoration: BoxDecoration(
                  color: colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: TextField(
                  controller: _loginForm.phoneEditingController,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text(l10n.phoneFieldLabel),
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 32,
                maxHeight: 32,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _loginForm.phoneValidationMessage ?? "",
                  style: theme.textTheme.bodySmall
                      ?.apply(color: colorScheme.error),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: TextField(
                  controller: _loginForm.passwordEditingController,
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text(l10n.passwordFieldLabel),
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 16,
                maxHeight: 16,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _loginForm.passwordValidationMessage ?? "",
                  style: theme.textTheme.bodySmall
                      ?.apply(color: colorScheme.error),
                ),
              ),
            ),
            ErrorMessageWidget(_loginForm.globalErrorMessage),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(l10n.forgetPasswordLink,
                  style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: SizeProvider.small)),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                      onPressed: _loginForm.submitCallback,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.nextButton,
                              style: theme.textTheme.labelLarge,
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: RichText(
                        text: TextSpan(
                            text: '${l10n.newMemberQuestion} ',
                            style: theme.textTheme.bodySmall,
                            children: [
                              TextSpan(
                                  text: l10n.registerLink,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.primary)),
                            ]),
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
