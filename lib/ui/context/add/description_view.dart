import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/ui/context/auth/widget.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/app_page.dart';
import 'package:r8it/ui/widget/form/text_field.dart';
import 'package:r8it/ui/widget/label.dart';

class DescriptionForm extends AppForm {
  final TextEditingController _descriptionController = TextEditingController();

  DescriptionForm(FormSubmitCallback submitCallback) : super(submitCallback);

  String get description => _descriptionController.text;
}

class DescriptionView extends StatelessWidget {
  final DescriptionForm _form;
  final String? imagePath;

  const DescriptionView(this._form, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenSize = MediaQuery.of(context).size;
    final previewSize = calculatePreviewSize(screenSize);

    return AppPage(
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Center(
              child: TitleText(l10n.rateItButton),
            ),
          ),
          imageOrPlaceHolder(
            previewSize,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MultiLineTextField(
                  controller: _form._descriptionController,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            child: FilledButton(
              onPressed: () => _form.submitCallback(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconLabel(
                  label: Text(l10n.nextButton),
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageOrPlaceHolder(Size size, Widget child) {
    if (imagePath == null) {
      return Container(
        width: double.infinity,
        height: size.height,
        color: Colors.grey,
        alignment: Alignment.bottomCenter,
        child: child,
      );
    }
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: FractionalOffset.topCenter,
                  image: FileImage(File(imagePath!)))),
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      ),
    );
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
