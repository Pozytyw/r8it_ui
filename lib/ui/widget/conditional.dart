import 'package:flutter/material.dart';

const shrink = SizedBox.shrink();

class ConditionalWidget extends StatelessWidget {
  final Widget child;
  final bool condition;

  const ConditionalWidget({
    required this.child,
    required this.condition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!condition) {
      return shrink;
    }
    return child;
  }
}
