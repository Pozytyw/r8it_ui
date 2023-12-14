import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:r8it/ui/widget/app_page.dart';
import 'package:r8it/ui/widget/placeholder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final spacer = SizedBox.fromSize(size: const Size(8, 8));

  @override
  Widget build(BuildContext context) {
    return AppPage(
      body: CustomScrollView(
        slivers: [
          searchAppBar(context),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => RateWidgetXXX(),
              childCount: 5,
            ),
          )
        ],
      ),
    );
  }

  SliverAppBar searchAppBar(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var style = theme.textTheme.titleLarge;
    var bottom = Xxx();
    return SliverAppBar(
      toolbarHeight: 0,
      titleSpacing: 4,
      // title: FilledButton(
      //   style: FilledButton.styleFrom(
      //     textStyle: style,
      //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(50),
      //     ),
      //   ),
      //   onPressed: () {},
      //   child: Row(
      //     children: [
      //       Icon(
      //         Icons.search_outlined,
      //         color: style?.color,
      //       ),
      //       spacer,
      //       Text('Search'),
      //     ],
      //   ),
      // ),
      flexibleSpace: const SizedBox.shrink(),
      bottom: bottom,
    );
  }
}

class RateWidgetXXX extends StatelessWidget {
  static final spacer = SizedBox.fromSize(size: const Size(8, 8));

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var style = theme.textTheme.bodySmall;
    var graySmall = theme.textTheme.labelSmall?.copyWith(color: Colors.grey);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(50),
                ),
                clipBehavior: Clip.hardEdge,
                width: 48,
                height: 48,
                child: PlaceholderTestFactory.personProfile(),
              ),
              spacer,
              Text('First name'),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: PlaceholderTestFactory.image(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.my_location,
                    size: 12,
                  ),
                  spacer,
                  Text(
                    'TOCIEKAWA',
                    style: style,
                  )
                ],
              ),
              spacer,
              RichText(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: PlaceholderTestFactory.testText,
                  style: theme.textTheme.bodyMedium,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => debugPrint('aaa'),
                ),
              ),
              spacer,
              Row(children: [
                Text('04:55 PM', style: graySmall),
                Text('23/10/2023', style: graySmall),
              ]),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }




}

class Xxx extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var spacer = SizedBox.fromSize(size: const Size(4, 0));
    return Container(
      alignment: Alignment.topLeft,
      height: preferredSize.height,
      padding: const EdgeInsets.only(left: 4),
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
  Size get preferredSize => Size.fromHeight(48);
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
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      minimumSize: const Size(0, 0),
    );

    return ElevatedButton(
      onPressed: () {},
      style: style,
      child: Text(name),
    );
  }
}
