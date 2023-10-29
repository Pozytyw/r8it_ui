import 'package:flutter/material.dart';
import 'package:r8it/ui/widget/style_factory.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String? _message;

  const ErrorMessageWidget(this._message, {super.key});

  @override
  Widget build(BuildContext context) {
    if (_message == null) {
      return SizedBox.fromSize(size: Size.zero);
    }

    var styleFactory = TextStyleFactory(context);
    return Center(
      child: SelectableText(
        _message!,
        style: styleFactory.getErrorTextTheme(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
