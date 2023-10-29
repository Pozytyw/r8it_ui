import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/storage/preferences.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/state/simple_events.dart';

import 'color_schema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: currentLanguageFuture(),
      builder: (context, snapshot) => BlocProvider(
        create: (_) => LocaleChangeState(snapshot.data ?? GlobalPreferences.defaultLocale),
        child: BlocBuilder<LocaleChangeState, Locale>(
          builder: (context, state) {
            GlobalPreferences.instance().then((p) => p.updatePreferableLocale(state));
            return buildWithLocaleFromPreferences(state);
          },
        ),
      ),
    );
  }

  Widget buildWithLocaleFromPreferences(Locale locale) {
    var appColorSchema = AppColorSchema();
    return MaterialApp.router(
      locale: locale,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      theme: appColorSchema.themeData,
      routerConfig: AppRouter.router,
    );
  }

  Future<Locale> currentLanguageFuture() {
    return GlobalPreferences.instance().then((it) => it.getPreferableLocale());
  }
}
