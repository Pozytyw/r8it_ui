import 'dart:ui';

import 'package:flutter/material.dart';

class RefreshableWidget extends StatelessWidget {
  final RefreshCallback onRefresh;
  final Widget child;

  const RefreshableWidget({
    required this.onRefresh,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold.of(context);
    var appBarMaxHeight = scaffold.appBarMaxHeight ?? 0;
    var mediaQuery = MediaQuery.of(context);
    var minHeight = mediaQuery.size.height - appBarMaxHeight;
    var minWidth = mediaQuery.size.width;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
          physics: const BouncingScrollPhysics(),
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.trackpad}),
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              constraints: BoxConstraints(minHeight: minHeight, minWidth: minWidth),
              child: child,
            )),
      ),
    );
  }
}
