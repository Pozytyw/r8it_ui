import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/domain/place/place.dart';
import 'package:r8it/domain/tag/tag.dart';
import 'package:r8it/ui/context/add/widget.dart';
import 'package:r8it/ui/context/auth/widget.dart';
import 'package:r8it/ui/form.dart';
import 'package:r8it/ui/widget/form/location_widget.dart';
import 'package:r8it/ui/widget/form/tag.dart';
import 'package:r8it/ui/widget/label.dart';

class TagForm extends AppForm {
  Place? place;
  String? customTag;
  final Map<String, Tag> _tagMap = {};

  TagForm({
    this.place,
    required FormSubmitCallback submitCallback,
  }) : super(submitCallback);

  List<Tag> get tagList => _tagMap.values.toList();

  void _selectTag(Tag tag) {
    _tagMap[tag.id] = tag;
  }

  void _unselectTag(Tag tag) {
    _tagMap.remove(tag.id);
  }
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _CollapsibleTagList(_form),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {},
            child: LocationWidget(
              _form.place?.name ?? l10n.unknownPlace,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ),
        const Spacer(),
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

  Future _submit(BuildContext context) async {
    return _form.submitCallback(context);
  }
}

class _CollapsibleTagList extends StatefulWidget {
  final TagForm form;

  const _CollapsibleTagList(this.form);

  @override
  State<_CollapsibleTagList> createState() => _CollapsibleTagListState();
}

class _CollapsibleTagListState extends State<_CollapsibleTagList> {
  bool _collapse = true;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 128,
      ),
      child: FutureBuilder(
        future: children(),
        builder: (context, snapshot) => SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            runSpacing: 8.0,
            children: snapshot.data ?? [],
          ),
        ),
      ),
    );
  }

  Future<List<Tag>> _tagList() {
    return Future.value([
      Tag('Coffee', 'Coffee1'),
      Tag('Books', 'Books2'),
      Tag('Movies', 'Movies3'),
      Tag('Coffee', 'Coffee4'),
      Tag('Books', 'Books5'),
      Tag('Movies', 'Movies6'),
      Tag('Coffee', 'Coffee7'),
      Tag('Books', 'Books8'),
    ]);
  }

  Future<List<Widget>> children() async {
    var tags = await _tagList();
    var results = <Widget>[];
    results.addAll(tags.sublist(0, 3).map(tagWidget));
    results.add(_CustomTagWidget(widget.form));
    if (!_collapse) {
      results.addAll(tags.sublist(3).map(tagWidget));
    }
    results.add(switchWidget());
    return results;
  }

  Widget tagWidget(Tag tag) {
    return TagCheckboxWidget(
      tag.name,
      onSelected: (v) {
        if (v) {
          widget.form._selectTag(tag);
          return;
        }
        widget.form._unselectTag(tag);
      },
    );
  }

  Widget switchWidget() {
    return TagWidget(
      '...',
      onPressed: () => setState(() {
        _collapse = !_collapse;
      }),
    );
  }
}

class _CustomTagWidget extends StatefulWidget {
  final TagForm form;

  const _CustomTagWidget(this.form, {super.key});

  @override
  State<_CustomTagWidget> createState() => _CustomTagWidgetState();
}

class _CustomTagWidgetState extends State<_CustomTagWidget> {
  bool selected = false;
  final editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    var backgroundColor =
        selected ? colorScheme.primary : colorScheme.onSurface;
    var textStyle = theme.textTheme.labelLarge;
    if (selected) {
      textStyle = textStyle?.copyWith(
        color: colorScheme.background,
      );
    }

    return IntrinsicWidth(
      child: TextField(
        onTap: _onSelect,
        style: textStyle,
        controller: editingController,
        decoration: InputDecoration(
          hintText: l10n.customTag,
          hintStyle: textStyle,
          contentPadding: const EdgeInsets.fromLTRB(12, 4, 12, 6),
          isCollapsed: true,
          filled: true,
          fillColor: backgroundColor,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void _onSelect() {
    setState(() {
      selected = !selected;
      if (selected) {
        widget.form.customTag = editingController.text;
        return;
      }
      widget.form.customTag = null;
    });
  }
}
