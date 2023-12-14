import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String? _message;

  const ErrorMessageWidget(this._message, {super.key});

  @override
  Widget build(BuildContext context) {
    if (_message == null) {
      return SizedBox.fromSize(size: Size.zero);
    }
    var theme = Theme.of(context);
    var style = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.error,
    );
    return Center(
      child: SelectableText(
        _message!,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
