import 'package:flutter/material.dart';

final class SpacingProvider {
  static const singleSpacingValue = 16.0;

  static const paddingAll1x = EdgeInsets.all(singleSpacingValue);
  static const paddingAll2x = EdgeInsets.all(singleSpacingValue * 2);
  static const paddingAll4x = EdgeInsets.all(singleSpacingValue * 4);

  static const paddingTop1x = EdgeInsets.fromLTRB(0, singleSpacingValue, 0, 0);
  SpacingProvider._();
}
