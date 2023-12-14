import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/context/auth/widget.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/error.dart';
import 'package:r8it/ui/widget/form/single_text_field.dart';
import 'package:r8it/ui/widget/label.dart';

class LoginForm extends AppForm {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm(FormSubmitCallback submitCallback) : super(submitCallback);

  String get email => _emailController.text;

  String get password => _passwordController.text;
}

class LoginView extends StatelessWidget {
  static const Widget spacer = SizedBox(height: 25);

  final LoginForm _loginForm;

  const LoginView(this._loginForm, {super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return AuthPage(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleText(l10n.loginWelcomeMessage),
          SubTitleText(l10n.loginMessage),
          spacer,
          SingleTextField(
            controller: _loginForm._emailController,
            label: Text(l10n.emailFieldLabel),
            errorMessage: _loginForm.errorMessage('email', l10n),
          ),
          spacer,
          SingleTextField(
            controller: _loginForm._passwordController,
            password: true,
            label: Text(l10n.passwordFieldLabel),
            errorMessage: _loginForm.errorMessage('password', l10n),
          ),
          ErrorMessageWidget(_loginForm.globalErrorMessage(l10n)),
          spacer,
          // todo: implement forget button
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              l10n.forgetPasswordLink,
              style: theme.textTheme.bodySmall,
            ),
          ),
          const Spacer(),
          FilledButton(
            onPressed: () => _loginForm.submitCallback(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconLabel(
                label: Text(l10n.nextButton),
                icon: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: "${l10n.newMemberQuestion} ",
                  style: theme.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: l10n.registerLink,
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
