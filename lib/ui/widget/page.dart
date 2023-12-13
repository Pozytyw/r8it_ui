import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  final EdgeInsets bodyPadding;
  final Widget? appBarTitleWidget;
  final Widget? body;
  final List<Widget>? actions;

  const AppPage({
    this.appBarTitleWidget,
    super.key,
    this.body,
    this.bodyPadding = const EdgeInsets.all(8.0),
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: appBarTitleWidget,
        elevation: 0,
        actions: actions,
      ),
      body: Padding(
        padding: bodyPadding,
        child: body,
      ),
    );
  }
}
