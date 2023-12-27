import 'package:flutter/material.dart';
import 'package:r8it/app_theme.dart';
import 'package:r8it/domain/user/info.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    var user = User(id: '1', email: 'email@example.com', username: 'username');
    return SingleChildScrollView(
      child: Column(
        children: [
          AddProfileWidget(user),
          AddProfileWidget(user),
          AddProfileWidget(user),
          AddProfileWidget(user),
          AddProfileWidget(user),
        ],
      ),
    );
  }
}

class AddProfileWidget extends StatelessWidget {
  final User user;

  const AddProfileWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
            onPressed: () {},
            child: Icon(Icons.add),
            style: FilledButton.styleFrom(
              foregroundColor: colorScheme.success,
            ),
          ),
          const SizedBox.square(dimension: 8),
          FilledButton(
            onPressed: () {},
            child: Icon(Icons.remove),
            style: FilledButton.styleFrom(
              foregroundColor: colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
