import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MultiLineTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? label;
  final int maxLines;
  final int minLines;

  const MultiLineTextField({
    super.key,
    this.controller,
    this.label,
    this.maxLines = 3,
    this.minLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return _TextFieldContainer(
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        autocorrect: true,
        enableSuggestions: false,
        decoration: InputDecoration(
            border: InputBorder.none,
            label: label,
            labelStyle: theme.textTheme.bodySmall),
      ),
    );
  }
}

class SingleTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorMessage;
  final Widget? label;
  final bool password;

  const SingleTextField({
    super.key,
    this.controller,
    this.errorMessage,
    this.label,
    this.password = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return _TextFieldContainer(
      errorMessage: errorMessage,
      child: TextField(
        controller: controller,
        obscureText: password,
        autocorrect: false,
        enableSuggestions: !password,
        decoration: InputDecoration(
            border: InputBorder.none,
            label: label,
            labelStyle: theme.textTheme.bodyMedium),
      ),
    );
  }
}

class _TextFieldContainer extends StatelessWidget {
  final String? errorMessage;
  final Widget child;

  const _TextFieldContainer({
    required this.child,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorScheme.onSurface,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: child,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 32,
            maxHeight: 32,
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: _errorWidget(theme, colorScheme)),
        ),
      ],
    );
  }

  Widget? _errorWidget(ThemeData theme, ColorScheme colorScheme) {
    if (errorMessage?.isNotEmpty ?? false) {
      return Text(
        errorMessage!,
        style: theme.textTheme.bodySmall?.apply(
          color: colorScheme.error,
        ),
      );
    }
    return null;
  }
}
