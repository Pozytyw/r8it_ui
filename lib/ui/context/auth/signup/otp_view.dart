import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/widget/error.dart';
import 'package:r8it/ui/widget/form/otp_field.dart';
import 'package:r8it/ui/widget/label.dart';
import 'package:r8it/ui/widget/page.dart';

class SignupOtpForm {
  String? recipient;
  final Function(BuildContext context, String otpValue) submitCallback;
  String? globalErrorMessage;

  SignupOtpForm(this.submitCallback);
}

class SignupOtpView extends StatefulWidget {
  final SignupOtpForm _signupForm;

  const SignupOtpView(this._signupForm, {super.key});

  @override
  State<SignupOtpView> createState() => _SignupOtpViewState();
}

class _SignupOtpViewState extends State<SignupOtpView> {
  String? otpValue;

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return AppPage(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(l10n.registerOtpWelcomeMessage,
              style: theme.textTheme.titleLarge),
          Text(
            l10n.registerOtpMessage(widget._signupForm.recipient ?? ''),
            style: theme.textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          OtpField((v) => onOtpSubmit(context, v)),
          const Spacer(),
          ErrorMessageWidget(widget._signupForm.globalErrorMessage),
          const Spacer(),
          FilledButton(
            onPressed: () => onSubmit(context),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconLabel(
                label: Text(
                  l10n.verifyButton,
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

  void onOtpSubmit(BuildContext context, String? value) {
    otpValue = value;
    onSubmit(context);
  }

  void onSubmit(BuildContext context) {
    if (otpValue?.isEmpty ?? true) {
      return;
    }
    widget._signupForm.submitCallback(context, otpValue!);
  }
}
