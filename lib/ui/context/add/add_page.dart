import 'package:flutter/material.dart';
import 'package:r8it/ui/context/add/camera_view.dart';
import 'package:r8it/ui/context/add/description_view.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late final PictureWithLocationForm _form;
  late final DescriptionForm _descriptionForm;
  _PageMode _pageMode = _PageMode.image;

  _AddPageState() {
    _form = PictureWithLocationForm(callback);
    _descriptionForm = DescriptionForm(callback);
  }

  @override
  Widget build(BuildContext context) {
    if (_pageMode == _PageMode.image) {
      return CameraView(_form);
    }
    return DescriptionView(_descriptionForm, _form.pathToImage);
  }

  Future callback(BuildContext context) async {
    setState(() {
      _pageMode = _PageMode.desc;
    });
  }
}

enum _PageMode { image, desc }
