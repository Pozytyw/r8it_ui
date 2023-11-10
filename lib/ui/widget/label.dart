import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final Widget label;
  final Icon icon;

  const IconLabel({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        label,
        icon,
      ],
    );
  }
}
