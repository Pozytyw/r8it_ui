import 'package:flutter/material.dart';
import 'package:r8it/ui/context/add/camera_view.dart';
import 'package:r8it/ui/context/add/description_view.dart';
import 'package:r8it/ui/context/add/tag_view.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late final PictureWithLocationForm _imageForm;
  late final DescriptionForm _descriptionForm;
  late final TagForm _tagForm;
  _PageMode _pageMode = _PageMode.image;

  _AddPageState() {
    _imageForm = PictureWithLocationForm(imageNext);
    _descriptionForm = DescriptionForm(descNext);
    _tagForm = TagForm(descNext);
  }

  @override
  Widget build(BuildContext context) {
    if (_pageMode == _PageMode.image) {
      return CameraView(_imageForm);
    }
    if (_pageMode == _PageMode.desc) {
      return DescriptionView(_descriptionForm, _imageForm.imagePath);
    }
    return TagView(_tagForm);
  }

  Future imageNext(BuildContext context) async {
    setState(() {
      _pageMode = _PageMode.desc;
    });
    _tagForm.locationSwitch = _imageForm.locationSwitch;
    _tagForm.locationData = _imageForm.locationData;
    _tagForm.imagePath = _imageForm.imagePath;
  }

  Future descNext(BuildContext context) async {
    setState(() {
      _pageMode = _PageMode.tag;
    });
    _tagForm.description = _descriptionForm.description;
  }
}

enum _PageMode { image, desc, tag }
