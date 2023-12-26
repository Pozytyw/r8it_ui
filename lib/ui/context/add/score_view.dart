import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r8it/app_theme.dart';
import 'package:r8it/ui/context/add/widget.dart';
import 'package:r8it/ui/context/auth/widget.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/conditional.dart';
import 'package:r8it/ui/widget/error.dart';
import 'package:r8it/ui/widget/form/location_widget.dart';
import 'package:r8it/ui/widget/label.dart';

class ScoreForm extends AppForm {
  double? _score;

  ScoreForm(FormSubmitCallback submitCallback) : super(submitCallback);

  double get score => _score!;
}

class ScoreView extends StatefulWidget {
  final ScoreForm _form;
  final String? imagePath;
  final String? locationName;

  const ScoreView(
    this._form,
    this.imagePath,
    this.locationName, {
    super.key,
  });

  @override
  State<ScoreView> createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  double _score = 1;
  _ScoreState _scoreState = _ScoreState.good;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorSchema = theme.colorScheme;
    ImageProvider? imageProvider;
    if (widget.imagePath != null) {
      imageProvider = FileImage(File(widget.imagePath!));
    }

    return Column(
      children: [
        ImagePreview(imageProvider),
        const Padding(
          padding: EdgeInsets.all(16.0),
        ),
        ConditionalWidget(
          condition: widget.locationName?.isNotEmpty == true,
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: LocationWidget(
              widget.locationName!,
              style: theme.textTheme.labelSmall,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Center(
            child: TitleText(l10n.rateItButton),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _setState(_ScoreState.bad),
                child: Transform.scale(
                  scale: _scoreState == _ScoreState.bad ? 1.25 : 1,
                  child: imageIcon('assets/images/idk.svg'),
                ),
              ),
              GestureDetector(
                onTap: () => _setState(_ScoreState.mid),
                child: Transform.scale(
                  scale: _scoreState == _ScoreState.mid ? 1.25 : 1,
                  child: imageIcon('assets/images/normal.svg'),
                ),
              ),
              GestureDetector(
                onTap: () => _setState(_ScoreState.good),
                child: Transform.scale(
                  scale: _scoreState == _ScoreState.good ? 1.25 : 1,
                  child: imageIcon('assets/images/like.svg'),
                ),
              ),
            ],
          ),
        ),
        ErrorMessageWidget(widget._form.globalErrorMessage(l10n)),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Container(
                height: 32,
                color: colorSchema.onSurface,
              ),
              Transform.scale(
                scaleX: _score,
                alignment: Alignment.topLeft,
                child: Container(
                  height: 32,
                  color: _colorByScore(colorSchema),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FilledButton(
            onPressed: () => _submit(context),
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

  void _setState(_ScoreState state) {
    setState(() {
      _scoreState = state;
      _score = _scoreByState(state);
    });
  }

  Color _colorByScore(ColorScheme colorSchema) {
    return switch (_scoreState) {
      _ScoreState.bad => colorSchema.error,
      _ScoreState.mid => colorSchema.warning,
      _ScoreState.good => colorSchema.success,
    };
  }

  Future<void> _submit(BuildContext context) {
    /*todo: validation*/
    widget._form._score = _score;
    return widget._form.submitCallback(context);
  }

  static Widget imageIcon(String path) {
    return SizedBox(
      height: 64,
      child: SvgPicture.asset(
        path,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  static double _scoreByState(_ScoreState state) {
    return switch (state) {
      _ScoreState.bad => 0.1,
      _ScoreState.mid => 0.5,
      _ScoreState.good => 1,
    };
  }
}

enum _ScoreState { bad, mid, good }
