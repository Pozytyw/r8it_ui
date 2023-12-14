import 'package:flutter/material.dart';
import 'package:r8it/app_theme.dart';
import 'package:r8it/ui/widget/app_page.dart';
import 'package:r8it/ui/widget/collapsable_text.dart';
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
              (context, index) => PostWidget(),
              childCount: 5,
            ),
          )
        ],
      ),
    );
  }

  SliverAppBar searchAppBar(BuildContext context) {
    return const SliverAppBar(
      toolbarHeight: 0,
      titleSpacing: 4,
      flexibleSpace: SizedBox.shrink(),
      bottom: BottomSearchBar(),
    );
  }
}

class BottomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const BottomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: preferredSize.height,
      padding: const EdgeInsets.all(8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TagWidget('Food'),
          TagWidget('Coffee'),
          TagWidget('Books'),
          TagWidget('Movies'),
          TagWidget('...'),
        ],
      ),
    );
  }

  /*todo: how to calculate it?*/
  @override
  Size get preferredSize => const Size.fromHeight(48);
}

class TagWidget extends StatelessWidget {
  final String name;

  const TagWidget(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorSchema = theme.colorScheme;

    var style = ElevatedButton.styleFrom(
        backgroundColor: colorSchema.onSurface,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        minimumSize: const Size(0, 0),
        textStyle: theme.textTheme.labelLarge);

    return ElevatedButton(
      onPressed: () {},
      style: style,
      child: Text(name),
    );
  }
}

class PostWidget extends StatelessWidget {
  static final spacer = SizedBox.fromSize(size: const Size(8, 8));

  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorSchema = theme.colorScheme;
    var gray = colorSchema.gray;
    var graySmall = theme.textTheme.bodySmall?.copyWith(color: gray);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: ProfileWidget(),
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
                  const Icon(
                    Icons.my_location,
                    size: 16,
                  ),
                  const SizedBox.square(dimension: 8),
                  Text('TOCIEKAWA', style: graySmall)
                ],
              ),
              spacer,
              CollapsableText(
                maxLines: 3,
                text: PlaceholderTestFactory.testText,
                style: theme.textTheme.bodyMedium,
              ),
              spacer,
              Row(children: [
                Text('04:55 PM', style: graySmall),
                Text('23/10/2023', style: graySmall),
              ]),
              Divider(color: colorSchema.primary),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return Row(
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
        const SizedBox.square(dimension: 8),
        Text(
          'Username',
          style: theme.textTheme.labelLarge,
        ),
      ],
    );
  }
}
