import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:r8it/app_theme.dart';
import 'package:r8it/domain/place/place.dart';
import 'package:r8it/domain/post/post.dart';
import 'package:r8it/ui/widget/app_page.dart';
import 'package:r8it/ui/widget/collapsable_text.dart';
import 'package:r8it/ui/widget/form/location_widget.dart';
import 'package:r8it/ui/widget/placeholder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(body: PageListWidget());
  }
}


class PageListWidget extends StatefulWidget {
  const PageListWidget({super.key});

  @override
  State<PageListWidget> createState() => _PageListWidgetState();
}

class _PageListWidgetState extends State<PageListWidget> {
  static const _pageSize = 20;

  final PagingController<int, Post> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final posts = <Post>[
      Post('username', Place('aaa', 'aa'), 'lorelreasdasd'),
      Post('username', Place('aaa', 'aa'), 'lorelreasdasd'),
    ];
    final nextPageKey = pageKey + posts.length;
    _pagingController.appendPage(posts, nextPageKey);
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, Post>(
    pagingController: _pagingController,
    builderDelegate: PagedChildBuilderDelegate<Post>(
      itemBuilder: (context, item, index) => const PostWidget(),
    ),
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}


class PostWidget extends StatelessWidget {
  static final spacer = SizedBox.fromSize(size: const Size(8, 8));

  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var gray = colorScheme.gray;
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
                  LocationWidget(
                    'TOCIEKAWA',
                    style: graySmall,
                  ),
                  const SizedBox.square(dimension: 8),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: 12,
                          color: colorScheme.secondary,
                        ),
                        Transform.scale(
                          alignment: Alignment.centerLeft,
                          scaleX: 0.5,
                          child: Container(
                            height: 12,
                            color: colorScheme.warning,
                          ),
                        ),
                      ],
                    ),
                  )
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
                Text('10:39', style: graySmall),
                const SizedBox.square(dimension: 8),
                Text('23/10/2023', style: graySmall),
              ]),
              Divider(color: colorScheme.primary),
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
          child: const Icon(Icons.person_rounded),
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
