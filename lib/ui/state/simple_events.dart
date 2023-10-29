import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleChangeState extends Cubit<Locale> {
  LocaleChangeState(Locale locale) : super(locale);

  void emitLocaleChange(Locale value) {
    emit(value);
  }
}
