import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/ui/context/add/widget.dart';
import 'package:r8it/ui/context/auth/widget.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/form/text_field.dart';
import 'package:r8it/ui/widget/label.dart';

class DescriptionForm extends AppForm {
  final TextEditingController _descriptionController = TextEditingController();

  DescriptionForm(FormSubmitCallback submitCallback) : super(submitCallback);

  String get description => _descriptionController.text;
}

class DescriptionView extends StatefulWidget {
  final DescriptionForm _form;
  final String? imagePath;

  const DescriptionView(this._form, this.imagePath, {super.key});

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  static const offsetUnfocused = Offset(0, 128);
  static const offsetFocused = Offset(0, 0);
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    ImageProvider? imageProvider;
    if (widget.imagePath != null) {
      imageProvider = FileImage(File(widget.imagePath!));
    }

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Center(
            child: TitleText(l10n.rateItButton),
          ),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ImagePreview(imageProvider),
            Transform.translate(
              offset: focused ? offsetFocused : offsetUnfocused,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Focus(
                  onFocusChange: (v) => setState(() => focused = v),
                  child: MultiLineTextField(
                    maxLines: 10,
                    minLines: 10,
                    controller: widget._form._descriptionController,
                  ),
                ),
              ),
            )
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FilledButton(
            onPressed: () => widget._form.submitCallback(context),
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
    );
  }
}
