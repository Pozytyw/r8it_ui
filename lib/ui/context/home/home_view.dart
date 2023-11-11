import 'package:flutter/material.dart';
import 'package:r8it/storage/vault.dart';
import 'package:r8it/ui/widget/page.dart';

import '../../app_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // var l10n = AppLocalizations.of(context);
    // var theme = Theme.of(context);
    // var colorScheme = theme.colorScheme;
    return AppPage(body: Column(
      children: [
        Text('Hi'),
        Text('username'),
        ElevatedButton(onPressed: () => _onPressed(context), child: Text('Log out'))
      ],
    ));
  }

  void _onPressed(BuildContext context) {
    Vault.instance().then((value) => value.removeAuthToken())
        .then((value) => AppRouter.goLoginPageName(context));
  }
}
