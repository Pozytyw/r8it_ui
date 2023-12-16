import 'package:flutter/material.dart';

class LocationSelectorWidget extends StatefulWidget {
  final String location;
  final Function(bool)? listener;
  final TextStyle? style;
  final Color unSelectedColor;
  final bool selected;

  const LocationSelectorWidget(
    this.location, {
    this.listener,
    this.style,
    required this.unSelectedColor,
    this.selected = true,
    super.key,
  });

  @override
  State<LocationSelectorWidget> createState() => _LocationSelectorWidgetState();
}

class _LocationSelectorWidgetState extends State<LocationSelectorWidget> {
  late final unSelectedColor =
      widget.style?.copyWith(color: widget.unSelectedColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _selectedSwitch,
        child: LocationWidget(
          widget.location,
          style: widget.selected ? widget.style : unSelectedColor,
        ));
  }

  void _selectedSwitch() {
    setState(() {
      widget.listener?.call(!widget.selected);
    });
  }
}

class LocationWidget extends StatelessWidget {
  final String location;
  final TextStyle? style;

  const LocationWidget(this.location, {this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.share_location,
          color: style?.color,
        ),
        const SizedBox.square(dimension: 8),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.5,
                color: style?.color ?? Colors.grey,
              ),
            ),
          ),
          child: Text(location, style: style),
        ),
      ],
    );
  }
}
