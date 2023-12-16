import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/app_page.dart';

class TagForm extends AppForm {
  LocationData? locationData;
  bool? locationSwitch;
  String? description;
  String? imagePath;

  TagForm(FormSubmitCallback submitCallback) : super(submitCallback);
}

class TagView extends StatelessWidget {
  final TagForm _form;

  const TagView(this._form, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      body: Column(
        children: [
          Text('locationSwitch: ${_form.locationSwitch}'),
          Text('locationData: ${_form.locationData}'),
          Text('locationSwitch: ${_form.locationSwitch}'),
          Text('desc: ${_form.description}'),
          Text('imagePath: ${_form.imagePath}'),
        ],
      ),
    );
  }
}
