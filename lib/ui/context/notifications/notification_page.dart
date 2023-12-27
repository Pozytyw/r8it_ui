import 'package:flutter/material.dart';
import 'package:r8it/ui/context/notifications/notification_view.dart';
import 'package:r8it/ui/widget/app_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(body: NotificationView());
  }
}
