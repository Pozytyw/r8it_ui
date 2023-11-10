import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/storage/preferences.dart';
import 'package:r8it/ui/state/simple_events.dart';

class AppPage extends StatelessWidget {
  final EdgeInsets bodyPadding;
  final Widget? appBarTitleWidget;
  final Widget? body;

  const AppPage({
    this.appBarTitleWidget,
    super.key,
    this.body,
    this.bodyPadding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: appBarTitleWidget,
        elevation: 0,
        actions: const [LanguageSelector()],
      ),
      body: Padding(
        padding: bodyPadding,
        child: body,
      ),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleChangeState, Locale>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            value: state.languageCode,
            items: supportedLanguagesAsDropdownMenuItem(),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            onChanged: (value) {
              setState(() {
                if (value != null && value.isNotEmpty) {
                  context.read<LocaleChangeState>().emit(Locale(value));
                }
              });
            },
          ),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> supportedLanguagesAsDropdownMenuItem() {
    return AppLocalizations.supportedLocales
        .map((e) => e.languageCode)
        .map((e) =>
        DropdownMenuItem<String>(value: e, child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(e),
        )))
        .toList();
  }

  Future<String> currentLanguageFuture() {
    return GlobalPreferences.instance().then((it) =>
    it
        .getPreferableLocale()
        .languageCode);
  }
}
