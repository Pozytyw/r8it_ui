import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/error.dart';
import 'package:r8it/ui/widget/form/single_text_field.dart';
import 'package:r8it/ui/widget/label.dart';
import 'package:r8it/ui/widget/page.dart';

class SignupForm extends AppForm {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _usernameEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  SignupForm(FormSubmitCallback submitCallback) : super(submitCallback);

  String get password => _passwordEditingController.text;

  String get username => _usernameEditingController.text;

  String get email => _emailEditingController.text;
}

class SignupView extends StatelessWidget {
  final SignupForm _signupForm;

  const SignupView(this._signupForm, {super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return AppPage(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(l10n.registerWelcomeMessage, style: theme.textTheme.titleLarge),
          Text(l10n.registerMessage, style: theme.textTheme.titleSmall),
          const SizedBox(height: 64),
          SingleTextField(
            controller: _signupForm._emailEditingController,
            label: Text(l10n.emailFieldLabel),
            errorMessage: _signupForm.errorMessage('email', l10n),
          ),
          SingleTextField(
            controller: _signupForm._usernameEditingController,
            label: Text(l10n.usernameFieldLabel),
            errorMessage: _signupForm.errorMessage('username', l10n),
          ),
          SingleTextField(
            controller: _signupForm._passwordEditingController,
            password: true,
            label: Text(l10n.passwordFieldLabel),
            errorMessage: _signupForm.errorMessage('password', l10n),
          ),
          ErrorMessageWidget(_signupForm.globalErrorMessage(l10n)),
          const Spacer(),
          FilledButton(
            onPressed: () => _signupForm.submitCallback(context),
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
                  text: "${l10n.oldMemberQuestion} ",
                  style: theme.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: l10n.loginLink,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => AppRouter.goLoginPageName(context),
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
