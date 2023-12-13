import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/ui/widget/refreshable.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final spacer = SizedBox.fromSize(size: const Size(8, 8));

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: searchAppBar(context),
      body: RefreshableWidget(
        onRefresh: Future.value,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ww(context),
              spacer,
              ww(context),
              spacer,
              ww(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget ww(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var style = theme.textTheme.bodyLarge;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onSurface,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.my_location, size: 16),
                spacer,
                Text('location name')
              ],
            ),
            spacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: colorScheme.onSecondary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: 48,
                      height: 48,
                    ),
                    spacer,
                    Text('First name'),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  child: Text(
                    '7',
                    style: style,
                  ),
                )
              ],
            ),
            spacer,
            Row(
              children: [
                Expanded(
                  child: image(),
                ),
              ],
            ),
            spacer,
            Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            spacer,
            Row(children: [
              Text('#food'),
            ]),
            spacer,
            Row(children: [
              Text('04:55 PM'),
              Text('23/10/2023'),
            ]),
            spacer,
            Row(
              children: [
                Icon(Icons.message),
                Icon(Icons.share),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/images/coffe.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  PreferredSizeWidget searchAppBar(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var style = theme.textTheme.titleLarge;
    var bottom = Xxx();
    return AppBar(
      toolbarHeight: bottom.preferredSize.height + 32,
      titleSpacing: 16,
      title: FilledButton(
        style: FilledButton.styleFrom(
          textStyle: style,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.search_outlined,
              color: style?.color,
            ),
            spacer,
            Text('Search'),
          ],
        ),
      ),
      // title: TextField(
      //   decoration: InputDecoration(
      //     contentPadding: EdgeInsets.symmetric(horizontal: 16),
      //     floatingLabelBehavior: FloatingLabelBehavior.never,
      //     border: OutlineInputBorder(
      //       borderSide: BorderSide.none,
      //       borderRadius: BorderRadius.circular(50),
      //     ),
      //     filled: true,
      //     label: Row(
      //       children: [
      //         Icon(Icons.search_outlined, color: style?.color,),
      //         spacer,
      //         Text('Search'),
      //       ],
      //     ),
      //   ),
      // ),
      flexibleSpace: const SizedBox.shrink(),
      bottom: bottom,
    );
  }
}

class Xxx extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var spacer = SizedBox.fromSize(size: const Size(8, 0));
    return Container(
      alignment: Alignment.topLeft,
      height: preferredSize.height,
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          TagWidget('Food'),
          spacer,
          TagWidget('Coffee'),
          spacer,
          TagWidget('Books'),
          spacer,
          TagWidget('Movies'),
          spacer,
          TagWidget('...'),
        ],
      ),
    );
  }

  /*todo: how to calculate it?*/
  @override
  Size get preferredSize => Size.fromHeight(32);
}

class TagWidget extends StatelessWidget {
  final String name;

  const TagWidget(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var style = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(12),
      minimumSize: const Size(0, 0),
    );

    return ElevatedButton(
      onPressed: () {},
      style: style,
      child: Text(name),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        decoration:
            InputDecoration(border: InputBorder.none, hintText: 'Search'),
      ),
    );
  }
}
