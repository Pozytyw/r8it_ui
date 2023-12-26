import 'package:flutter/material.dart';

const shrink = SizedBox.shrink();

class ConditionalWidget extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  final bool condition;

  const ConditionalWidget({
    required this.builder,
    required this.condition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!condition) {
      return shrink;
    }
    return builder.call(context);
  }
}
