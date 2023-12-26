import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r8it/app_theme.dart';
import 'package:r8it/ui/context/add/widget.dart';
import 'package:r8it/ui/context/auth/widget.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/form/location_widget.dart';
import 'package:r8it/ui/widget/label.dart';

class ScoreForm extends AppForm {
  ScoreForm(FormSubmitCallback submitCallback) : super(submitCallback);
}

class ScoreView extends StatelessWidget {
  final ScoreForm _form;
  final String? imagePath;

  const ScoreView(this._form, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorSchema = theme.colorScheme;
    ImageProvider? imageProvider;
    if (imagePath != null) {
      imageProvider = FileImage(File(imagePath!));
    }

    return Column(
      children: [
        ImagePreview(imageProvider),
        const Padding(
          padding: EdgeInsets.all(16.0),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: LocationWidget(
            'TOCIEKAWA',
            style: theme.textTheme.labelSmall
          ),
        ),
        SizedBox(
          height: 50,
          child: Center(
            child: TitleText(l10n.rateItButton),
          ),
        ),
        SizedBox.square(dimension: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              imageIcon('assets/images/idk.svg'),
              Transform.scale(scale: 1.25,child: imageIcon('assets/images/normal.svg')),
              imageIcon('assets/images/like.svg'),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 32,
                color: colorSchema.onSurface,
              ),
              Container(
                width: 500,
                height: 32,
                color: colorSchema.warning,
              )
            ],
          ),
        ),
        SizedBox.square(dimension: 32),
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

  static Widget imageIcon(String path) {
    return Container(
      height: 64,
      child: SvgPicture.asset(
        path,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
