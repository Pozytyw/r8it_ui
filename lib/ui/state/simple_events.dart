import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleChangeState extends Cubit<Locale> {
  LocaleChangeState(Locale locale) : super(locale);

  void emitLocaleChange(Locale value) {
    emit(value);
  }
}

class LoadingState extends Cubit<bool> {
  LoadingState(isLoading) : super(isLoading);

  static void emitLoading(BuildContext context, bool value) {
    context.read<LoadingState>().emit(true);
  }
}
