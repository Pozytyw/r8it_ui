import 'package:flutter/material.dart';
import 'package:r8it/app_theme.dart';

const String _invisibleChar = '\u200B';

String _trim(String value) {
  return value.trim().replaceAll(_invisibleChar, "");
}

class OtpField extends StatefulWidget {
  final Function(String value) onSubmit;

  const OtpField(this.onSubmit, {super.key});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        _SingleNumberField(_onValueChanged, controllers[0], 0),
        _SingleNumberField(_onValueChanged, controllers[1], 1),
        _SingleNumberField(_onValueChanged, controllers[2], 2),
        _SingleNumberField(_onValueChanged, controllers[3], 3),
        _SingleNumberField(_onValueChanged, controllers[4], 4),
        _SingleNumberField(_onValueChanged, controllers[5], 5),
      ],
    );
  }

  void _onValueChanged() {
    var value = collectAllValues();
    if (value.length == 6) {
      widget.onSubmit(value);
    }
  }

  String collectAllValues() {
    return controllers.map((e) => _trim(e.text)).join();
  }
}

class _SingleNumberField extends StatefulWidget {
  final Function() onValueChanged;
  final TextEditingController controller;
  final int selfIndex;

  const _SingleNumberField(this.onValueChanged, this.controller, this.selfIndex);

  @override
  State<_SingleNumberField> createState() => _SingleNumberFieldState();
}

class _SingleNumberFieldState extends State<_SingleNumberField> {
  bool _filled = false;

  @override
  Widget build(BuildContext context) {
    resetController();
    /*todo: calculate by text size*/
    const inputConstraints = BoxConstraints(minWidth: 46, maxWidth: 46);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return TextField(
      maxLines: 1,
      autofocus: false,
      keyboardType: TextInputType.number,
      maxLength: 2,
      style: theme.textTheme.bodyLarge,
      controller: widget.controller,
      onChanged: _onChanged,
      decoration: InputDecoration(
        counterText: "",
        constraints: inputConstraints,
        isDense: false,
        fillColor: _filled ? colorScheme.success : colorScheme.onSurface,
        filled: true,
        // border: InputBorder.none,
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.success),
        ),
      ),
      textAlign: TextAlign.center,
    );
  }

  void _onChanged(String? value) {
    if (value?.isEmpty ?? true) {
      resetController();
      if (widget.selfIndex != 0) {
        FocusScope.of(context).previousFocus();
      }
      setState(() {
        _filled = false;
      });
      return;
    }
    var trimmedValue = _trim(value!);
    if (trimmedValue.isEmpty) {
      return;
    }
    if (trimmedValue.length > 1) {
      widget.controller.text = trimmedValue[1];
    }
    if (widget.selfIndex != 5) {
      FocusScope.of(context).nextFocus();
    }
    setState(() {
      _filled = true;
    });
    widget.onValueChanged();
  }

  void resetController() {
    if (widget.controller.text.isEmpty) {
      widget.controller.text = _invisibleChar;
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
