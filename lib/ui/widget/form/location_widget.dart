import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:r8it/app_theme.dart';

class LocationController {
  final Set<VoidCallback> _listeners = {};

  bool _enabled;

  LocationController({bool enabled = false}) : _enabled = enabled;

  bool get enabled => _enabled;

  set enabled(bool value) {
    _enabled = value;
    for (var lister in _listeners) {
      lister.call();
    }
  }

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }
}

class DataLocationController extends LocationController {
  final Location location = Location();
  LocationDataState? _state;
  LocationData? _locationData;

  DataLocationController() : super(enabled: true) {
    updateLocation();
  }

  @override
  set enabled(bool value) {
    super.enabled = value;
    if (enabled) {
      updateLocation();
    }
  }

  LocationData? get locationData => _locationData;

  LocationDataState? get state => _state;

  Future updateLocation() async {
    if (await _ensurePermission() && await _ensureServiceEnabled()) {
      _state = LocationDataState.ensured;
      return location
          .getLocation()
          .then((l) => _locationData = l)
          .then((_) => _state = LocationDataState.read)
          .then((_) => debugPrint('finished update'));
    }
    enabled = false;
  }

  Future<bool> _ensurePermission() async {
    return await location.hasPermission() == PermissionStatus.granted ||
        await location.requestPermission() == PermissionStatus.granted;
  }

  Future<bool> _ensureServiceEnabled() async {
    return await location.serviceEnabled() || await location.requestService();
  }

  bool isLoading() {
    return enabled && _state == LocationDataState.ensured;
  }
}

enum LocationDataState { read, ensured }

class LocationCheckboxWidget extends StatefulWidget {
  final String location;
  final LocationController _controller;
  final TextStyle? style;

  LocationCheckboxWidget(
    this.location, {
    LocationController? controller,
    this.style,
    super.key,
  }) : _controller = controller ?? LocationController();

  @override
  State<LocationCheckboxWidget> createState() => _LocationCheckboxWidgetState();
}

class _LocationCheckboxWidgetState extends State<LocationCheckboxWidget> {
  @override
  void initState() {
    super.initState();
    widget._controller.addListener(_refresh);
  }

  @override
  Widget build(BuildContext context) {
    var unselectedStyle = widget.style?.copyWith(
      color: Theme.of(context).colorScheme.gray,
    );
    return GestureDetector(
        onTap: _selectedSwitch,
        child: LocationWidget(
          widget.location,
          style: widget._controller.enabled ? widget.style : unselectedStyle,
        ));
  }

  void _selectedSwitch() {
    /*todo: fixit*/
    /*todo: we need to rethink this widget. We need loading idicator while reading location data
    *  to ensure data is read!*/
    setState(() {
      widget._controller.enabled = !widget._controller.enabled;
    });
  }

  void _refresh() {
    setState(() {});
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
