import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r8it/domain/rit_repository.dart';
import 'package:r8it/domain/user/info.dart';
import 'package:r8it/storage/vault.dart';
import 'package:r8it/ui/app_router.dart';
import 'package:r8it/ui/context/auth/widget.dart';
import 'package:r8it/ui/widget/app_page.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return AppPage(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleText(l10n.profileWelcomeMessage),
            ],
          ),
          FutureBuilder(
            future: _fetchUserInfo(),
            builder: (context, snapshot) =>
                SubTitleText(snapshot.data?.username ?? '{username}'),
          ),
          ElevatedButton(
            onPressed: () => _onPressed(context),
            child: const Icon(Icons.logout),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                imageIcon('assets/images/idk.svg'),
                imageIcon('assets/images/normal.svg'),
                imageIcon('assets/images/like.svg'),
              ],
            ),
          ),
          Text(
            'Checkout author - catalyststuff - https://www.freepik.com/author/catalyststuff',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Future<User> _fetchUserInfo() {
    return RitRepository.instance().userInfo();
  }

  void _onPressed(BuildContext context) {
    Vault.instance()
        .then((value) => value.removeAuthToken())
        .then((value) => AppRouter.goLoginPageName(context));
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
}
