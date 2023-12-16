import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:location/location.dart';
import 'package:r8it/app_theme.dart';
import 'package:r8it/ui/context/add/widget.dart';
import 'package:r8it/ui/context/auth/widget.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/app_page.dart';
import 'package:r8it/ui/widget/conditional.dart';
import 'package:r8it/ui/widget/label.dart';
import 'package:r8it/ui/widget/location_widget.dart';

class PictureWithLocationForm extends AppForm {
  String? _pathToImage;
  final DataLocationController _locationController = DataLocationController();

  PictureWithLocationForm(FormSubmitCallback submitCallback)
      : super(submitCallback);

  bool get locationSwitch => _locationController.enabled;

  LocationData? get locationData => _locationController.locationData;

  String? get imagePath => _pathToImage;
}

class CameraView extends StatefulWidget {
  final PictureWithLocationForm _form;

  const CameraView(this._form, {super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _controller;
  Future? _firstInitializationFuture;
  ImageProvider? image;

  @override
  void initState() {
    super.initState();
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
              ConditionalWidget(
                condition: image == null,
                child: CameraPreview(_controller!),
              ),
              Column(
                children: [
                  Container(
                    color: colorScheme.background,
                    height: 50,
                    child: Center(
                      child: TitleText(l10n.rateItButton),
                    ),
                  ),
                  ImagePreview(
                    placeholderColor: image == null ? Colors.transparent : null,
                    image,
                  ),
                  Expanded(
                    child: Container(
                      color: colorScheme.background,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LocationCheckboxWidget(
                              l10n.shareLocation,
                              controller: widget._form._locationController,
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

  Future<void> _takePicture() async {
    await _initializeControllerFuture(null);
    final file = await _controller?.takePicture();
    if (file == null) {
      return;
    }
    setState(() {
      widget._form._pathToImage = file.path;
      image = FileImage(File(file.path));
    });
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
    return _controller?.initialize().timeout(const Duration(seconds: 10)) ??
        Future.value();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
