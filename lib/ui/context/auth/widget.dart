import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String data;

  const TitleText(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text(
      data,
      style: theme.textTheme.titleLarge,
      textAlign: TextAlign.center,
    );
  }
}

class SubTitleText extends StatelessWidget {
  final String data;

  const SubTitleText(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text(
      data,
      style: theme.textTheme.titleMedium,
      textAlign: TextAlign.center,
    );
  }
}

class AuthPage extends StatelessWidget {
  final EdgeInsets bodyPadding;
  final Widget? appBarTitleWidget;
  final Widget? body;
  final List<Widget>? actions;

  const AuthPage({
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
