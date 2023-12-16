import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:location/location.dart';
import 'package:r8it/app_theme.dart';
import 'package:r8it/ui/context/auth/widget.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/app_page.dart';
import 'package:r8it/ui/widget/label.dart';
import 'package:r8it/ui/widget/location_widget.dart';

class PictureWithLocationForm extends AppForm {
  String? _pathToImage;
  LocationData? _locationData;
  bool _locationSwitch = true;

  PictureWithLocationForm(FormSubmitCallback submitCallback)
      : super(submitCallback);

  bool get locationSwitch => _locationSwitch;

  LocationData? get locationData => _locationData;

  String? get pathToImage => _pathToImage;
}

class CameraView extends StatefulWidget {
  final PictureWithLocationForm _form;

  const CameraView(this._form, {super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final Location location = Location();
  CameraController? _controller;
  Future? _firstInitializationFuture;
  Image? image;

  @override
  void initState() {
    super.initState();
    location.getLocation()
        .then((l) => widget._form._locationData = l);
    _firstInitializationFuture = _frontCamera()
        .then(_createController)
        .then((controller) => _controller = controller)
        .then(_initializeControllerFuture);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenSize = MediaQuery.of(context).size;
    final previewSize = calculatePreviewSize(screenSize);

    return FutureBuilder(
      future: _firstInitializationFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const AppPage(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (_controller == null) {
          return const Center(
            child: Text('Could not initialize camera! Try again later'),
          );
        }
        return AppPage(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              _previewOrImage(),
              Column(
                children: [
                  Container(
                    color: colorScheme.background,
                    height: 50,
                    child: Center(
                      child: TitleText(l10n.rateItButton),
                    ),
                  ),
                  Container(height: previewSize.height),
                  Expanded(
                    child: Container(
                      color: colorScheme.background,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LocationSelectorWidget(
                              l10n.shareLocation,
                              selected: widget._form.locationSwitch,
                              listener: _locationSwitchListener,
                              style: theme.textTheme.bodyLarge,
                              unSelectedColor: colorScheme.gray,
                            ),
                            Expanded(
                              child: Center(
                                child: FilledButton(
                                  onPressed: _takePicture,
                                  style: FilledButton.styleFrom(
                                    shape: const CircleBorder(),
                                  ),
                                  child: const SizedBox.square(dimension: 64),
                                ),
                              ),
                            ),
                            FilledButton(
                              onPressed: () =>
                                  widget._form.submitCallback(context),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconLabel(
                                  label: Text(l10n.nextButton),
                                  icon: const Icon(
                                      Icons.arrow_forward_ios_rounded),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _previewOrImage() {
    if (image != null) {
      return image!;
    }
    return CameraPreview(_controller!);
  }

  Future<void> _takePicture() async {
    await _initializeControllerFuture(null);
    final file = await _controller?.takePicture();
    if (file == null) {
      return;
    }
    setState(() {
      widget._form._pathToImage = file.path;
      image = Image.file(File(file.path));
    });
  }

  void _locationSwitchListener(bool selected) async {
    setState(() {
      widget._form._locationSwitch = selected;
    });
    if (selected) {
      if (await _ensurePermission() && await _ensureServiceEnabled()) {
        widget._form._locationData = await location.getLocation();
      }
    }
  }

  Future<bool> _ensurePermission() async {
    return await location.hasPermission() == PermissionStatus.granted ||
        await location.requestPermission() == PermissionStatus.granted;
  }

  Future<bool> _ensureServiceEnabled() async {
    return await location.serviceEnabled() || await location.requestService();
  }

  Future<CameraDescription> _frontCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    var cameraList = await availableCameras();
    return cameraList.first;
  }

  CameraController _createController(CameraDescription camera) {
    return CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: false,
    );
  }

  Future<void> _initializeControllerFuture(args) {
    return _controller?.initialize() ?? Future.value();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Size calculatePreviewSize(Size screenSize) {
    const maxRatio = 0.5;
    var height = screenSize.height;
    var width = screenSize.width;
    if (width < height && width / height <= maxRatio) {
      debugPrint('Preview by width');
      return Size(double.infinity, width);
    }
    debugPrint('Static preview');
    return const Size(300, 300);
  }
}
