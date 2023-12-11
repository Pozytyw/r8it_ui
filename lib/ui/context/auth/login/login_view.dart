import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/error.dart';
import 'package:r8it/ui/widget/form/single_text_field.dart';
import 'package:r8it/ui/widget/label.dart';
import 'package:r8it/ui/widget/page.dart';

class LoginForm extends AppForm {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm(FormSubmitCallback submitCallback) : super(submitCallback);

  String get email => _emailController.text;
  String get password => _passwordController.text;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(l10n.loginWelcomeMessage, style: theme.textTheme.titleLarge),
          Text(l10n.loginMessage, style: theme.textTheme.titleSmall),
          const SizedBox(height: 64),
          SingleTextField(
            controller: _loginForm._emailController,
            label: Text(l10n.emailFieldLabel),
            errorMessage: _loginForm.errorMessage('email', l10n),
          ),
          SingleTextField(
            controller: _loginForm._passwordController,
            password: true,
            label: Text(l10n.passwordFieldLabel),
            errorMessage: _loginForm.errorMessage('password', l10n),
          ),
          ErrorMessageWidget(_loginForm.globalErrorMessage(l10n)),
          // todo: implement forget button
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Text(
          //     l10n.forgetPasswordLink,
          //     style: theme.textTheme.bodyMedium?.apply(
          //       color: colorScheme.primary,
          //     ),
          //   ),
          // ),
          const Spacer(),
          FilledButton(
            onPressed: () => _loginForm.submitCallback(context),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconLabel(
                label: Text(
                  l10n.nextButton,
                  style: theme.textTheme.bodyLarge,
                ),
                icon: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: "${l10n.newMemberQuestion} ",
                  style: theme.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: l10n.registerLink,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => AppRouter.goSignupPageName(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
