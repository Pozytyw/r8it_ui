import 'package:flutter/material.dart';
import 'package:r8it/ui/context/add/camera_view.dart';
import 'package:r8it/ui/context/add/description_view.dart';
import 'package:r8it/ui/context/add/score_view.dart';
import 'package:r8it/ui/context/add/tag_view.dart';
import 'package:r8it/ui/widget/app_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late final PictureWithLocationForm _imageForm;
  late final DescriptionForm _descriptionForm;
  late final TagForm _tagForm;
  late final ScoreForm _scoreForm;
  _PageMode _pageMode = _PageMode.image;

  _AddPageState() {
    _imageForm = PictureWithLocationForm(_imageNext);
    _descriptionForm = DescriptionForm(_descNext);
    _tagForm = TagForm(_tagNext);
    _scoreForm = ScoreForm(_tagNext);
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(body: buildBody(context));
  }

  Widget buildBody (BuildContext context) {
    if (_pageMode == _PageMode.image) {
      return CameraView(_imageForm);
    }
    if (_pageMode == _PageMode.desc) {
      return DescriptionView(_descriptionForm, _imageForm.imagePath);
    }
    if (_pageMode == _PageMode.tag) {
      return TagView(_tagForm, _imageForm.imagePath);
    }
    return ScoreView(_scoreForm, _imageForm.imagePath);
  }

  Future _imageNext(BuildContext context) async {
    setState(() {
      _pageMode = _PageMode.desc;
    });
  }

  Future _descNext(BuildContext context) async {
    setState(() {
      _pageMode = _PageMode.tag;
    });
  }

  Future _tagNext(BuildContext context) async {
    setState(() {
      _pageMode = _PageMode.score;
    });
  }
}

enum _PageMode { image, desc, tag, score }
