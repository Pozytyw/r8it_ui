import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:r8it/ui/widget/placeholder.dart';

class CollapsableText extends StatefulWidget {
  final int? maxLines;
  final String? text;
  final TextStyle? style;

  const CollapsableText({
    super.key,
    this.maxLines,
    this.text,
    this.style,
  });

  @override
  State<CollapsableText> createState() => _CollapsableTextState();
}

class _CollapsableTextState extends State<CollapsableText> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var style = theme.textTheme.bodySmall;
    var graySmall = theme.textTheme.labelSmall?.copyWith(color: Colors.grey);

    return RichText(
      maxLines: widget.maxLines,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: widget.text,
        style: widget.style,
        recognizer: TapGestureRecognizer()..onTap = () => debugPrint('aaa'),
      ),
    );
  }
}
