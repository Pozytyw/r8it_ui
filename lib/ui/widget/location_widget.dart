import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationController {
  bool _enabled;

  LocationController({bool enabled = false}) : _enabled = enabled;

  bool get enabled => _enabled;

  set enabled(bool value) {
    _enabled = value;
  }
}

class DataLocationController extends LocationController {
  final Location location = Location();
  LocationData? _locationData;

  DataLocationController() : super(enabled: true) {
    tryUpdateLocationData();
  }

  @override
  set enabled(bool value) {
    _enabled = value;
    if (_enabled) {
      tryUpdateLocationData();
    }
  }

  Future tryUpdateLocationData() async {
    if (await _ensurePermission() && await _ensureServiceEnabled()) {
      location.getLocation().then((l) => _locationData = l);
    }
  }

  Future<bool> _ensurePermission() async {
    return await location.hasPermission() == PermissionStatus.granted ||
        await location.requestPermission() == PermissionStatus.granted;
  }

  Future<bool> _ensureServiceEnabled() async {
    return await location.serviceEnabled() || await location.requestService();
  }

  LocationData? get locationData => _locationData;
}

class LocationCheckboxWidget extends StatefulWidget {
  final String location;
  final LocationController _controller;
  final TextStyle? style;
  final Color unSelectedColor;

  LocationCheckboxWidget(
    this.location, {
    LocationController? controller,
    this.style,
    required this.unSelectedColor,
    super.key,
  }) : _controller = controller ?? LocationController();

  @override
  State<LocationCheckboxWidget> createState() => _LocationCheckboxWidgetState();
}

class _LocationCheckboxWidgetState extends State<LocationCheckboxWidget> {
  late final unSelectedColor =
      widget.style?.copyWith(color: widget.unSelectedColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _selectedSwitch,
        child: LocationWidget(
          widget.location,
          style: widget._controller.enabled ? widget.style : unSelectedColor,
        ));
  }

  void _selectedSwitch() {
    setState(() {
      widget._controller._enabled = !widget._controller._enabled;
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
