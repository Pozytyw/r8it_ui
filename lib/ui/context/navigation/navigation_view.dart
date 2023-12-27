import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:r8it/domain/user/info.dart';
import 'package:r8it/ui/widget/app_page.dart';
import 'package:r8it/ui/widget/label.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      body: SearchWidget(),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  static const _pageSize = 20;

  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final results = <dynamic>[
      User(id: '1', username: 'username1', email: 'user@example.com'),
      User(id: '1', username: 'username2', email: 'user@example.com'),
      User(id: '1', username: 'username3', email: 'user@example.com'),
      User(id: '1', username: 'username4', email: 'user@example.com'),
      User(id: '1', username: 'username5', email: 'user@example.com'),
    ];
    final nextPageKey = pageKey + results.length;
    _pagingController.appendPage(results, nextPageKey);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          titleSpacing: 8,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                size: 32,
              ),
            ),
            SizedBox.square(dimension: 8),
          ],
          title: TextField(
            decoration: InputDecoration(hintText: l10n.searchHint),
          ),
        ),
        PagedSliverList<int, dynamic>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<dynamic>(
            itemBuilder: (context, item, index) {
              if (item is User) {
                return AddProfileWidget(item);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

class AddProfileWidget extends StatelessWidget {
  final User user;
  const AddProfileWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
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
            child: const Icon(Icons.person_rounded),
          ),
          const SizedBox.square(dimension: 8),
          Text(user.username),
          const SizedBox.square(dimension: 8),
          FilledButton(
            onPressed: (){},
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

