import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/exception/service_exception.dart';

abstract class AppForm {
  final FormSubmitCallback submitCallback;
  ServiceException? lastError;

  AppForm(this.submitCallback);

  void cleanErrorMessage() {
    lastError = null;
  }

  void fillErrorMessages(error) {
    if (error is ServiceException) {
      lastError = error;
      return;
    }
    if (error is DioException &&
        error.error != null &&
        error.error is ServiceException) {
      lastError = error.error as ServiceException;
    }
  }

  String? globalErrorMessage(AppLocalizations l10n) {
    return lastError?.message;
  }

  String? errorMessage(String fieldName, AppLocalizations l10n) {
    return lastError?.fieldConstraintViolation?[fieldName];
  }
}

typedef FormSubmitCallback = Future Function(BuildContext);
typedef ServiceExceptionHandler = void Function(ServiceException);
