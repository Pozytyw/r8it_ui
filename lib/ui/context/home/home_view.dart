import 'package:flutter/material.dart';
import 'package:r8it/domain/rit_repository.dart';
import 'package:r8it/storage/vault.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/widget/page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // var l10n = AppLocalizations.of(context);
    // var theme = Theme.of(context);
    // var colorScheme = theme.colorScheme;
    return AppPage(
      body: Center(
        child: Column(
          children: [
            Text('Hi'),
            UserInfo(),
            ElevatedButton(
                onPressed: () => _onPressed(context), child: Text('Log out'))
          ],
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    Vault.instance()
        .then((value) => value.removeAuthToken())
        .then((value) => AppRouter.goLoginPageName(context));
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _fetchUserInfo(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Text(snapshot.data ?? '');
      },
    );
  }

  Future<String> _fetchUserInfo() {
    return RitRepository.instance().userInfo().then((info) => info.username);
  }
}
