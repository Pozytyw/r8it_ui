import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/ui/context/add/widget.dart';
import 'package:r8it/ui/context/auth/widget.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/form/location_widget.dart';
import 'package:r8it/ui/widget/form/tag.dart';
import 'package:r8it/ui/widget/label.dart';

class TagForm extends AppForm {
  final TextEditingController _descriptionController = TextEditingController();

  TagForm(FormSubmitCallback submitCallback) : super(submitCallback);

  String get description => _descriptionController.text;
}

class TagView extends StatelessWidget {
  final TagForm _form;
  final String? imagePath;

  const TagView(this._form, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    ImageProvider? imageProvider;
    if (imagePath != null) {
      imageProvider = FileImage(File(imagePath!));
    }

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Center(
            child: TitleText(l10n.rateItButton),
          ),
        ),
        ImagePreview(imageProvider),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TagCheckboxWidget(
                'Food',
                selected: true,
              ),
              TagCheckboxWidget('Coffee'),
              TagCheckboxWidget('Books'),
              TagCheckboxWidget('Movies'),
              TagCheckboxWidget('...'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: LocationCheckboxWidget(
            'TOCIEKAWA',
            style: theme.textTheme.bodyLarge,
            controller: LocationController(enabled: true),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
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
    );
  }
}
