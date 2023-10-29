import 'package:flutter/material.dart';

class TextStyleFactory {
  final ThemeData _theme;

  TextStyleFactory(BuildContext context) : _theme = Theme.of(context);

  TextStyle? getErrorTextTheme() {
    return _theme.textTheme.bodyMedium?.copyWith(
      color: _theme.colorScheme.error,
    );
  }
}
