import 'package:flutter/material.dart';

class AppColorSchema {

  static const Color background = Color(0xff1c2755);
  static const Color white = Color(0xffffffff);

  static final ThemeData _themeData = themeDataInit();

  ThemeData get themeData => _themeData;

  static ThemeData themeDataInit() {
    var themeData = ThemeData.dark(useMaterial3: true);
    return themeData.copyWith(
      textTheme: themeData.textTheme.apply(
          // displayColor: Colors.red,
          // bodyColor: Colors.red,
          // decoration: TextDecoration.none,
          // decorationColor: Colors.red,
          // decorationStyle: TextDecorationStyle.dashed,
          ),
      buttonTheme: themeData.buttonTheme.copyWith(
        // buttonColor: Colors.red,
        // disabledColor: Colors.red,
        // focusColor: Colors.red,
        // hoverColor: Colors.red,
        // highlightColor: Colors.red,
        // splashColor: Colors.red,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.red,
        ),
      ),
      // canvasColor: Colors.red,
      // cardColor: Colors.red,
      // dialogBackgroundColor: Colors.red,
      // disabledColor: Colors.red,
      // dividerColor: Colors.red,
      // focusColor: Colors.red,
      // highlightColor: Colors.red,
      // hintColor: Colors.red,
      // hoverColor: Colors.red,
      // indicatorColor: Colors.red,
      // primaryColor: Colors.red,
      // primaryColorDark: Colors.red,
      // primaryColorLight: Colors.red,
      scaffoldBackgroundColor: background,
      secondaryHeaderColor: Colors.red,
      // shadowColor: Colors.red,
      // splashColor: Colors.red,
      // unselectedWidgetColor: Colors.red,
      colorScheme: themeData.colorScheme.copyWith(
      // primary: Colors.red,
      // onPrimary: Colors.red,
      // primaryContainer: Colors.red,
      // onPrimaryContainer: Colors.red,
      // secondary: Colors.red,
      // onSecondary: Colors.red,
      // secondaryContainer: Colors.red,
      // onSecondaryContainer: Colors.red,
      // tertiary: Colors.red,
      // onTertiary: Colors.red,
      // tertiaryContainer: Colors.red,
      // onTertiaryContainer: Colors.red,
      // error: Colors.red,
      // onError: Colors.red,
      // errorContainer: Colors.red,
      // onErrorContainer: Colors.red,
      // background: Colors.red,
      // onBackground: Colors.red,
      surface: background,
      // onSurface: Colors.red,
      // surfaceVariant: Colors.red,
      // onSurfaceVariant: Colors.red,
      // outline: Colors.red,
      // outlineVariant: Colors.red,
      // shadow: Colors.red,
      // scrim: Colors.red,
      // inverseSurface: Colors.red,
      // onInverseSurface: Colors.red,
      // inversePrimary: Colors.red,
      // surfaceTint: Colors.red,
      ),
    );
  }
}
