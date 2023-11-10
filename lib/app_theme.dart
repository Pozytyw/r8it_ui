import 'package:flutter/material.dart';

class AppThemeData {
  static const Color background = Color(0xff151d3d);
  static const Color onSurface = Color(0xff1c2755);
  static const Color primaryColor = Color(0xff3658D7);
  static const Color white = Color(0xffffffff);
  static const Color error = Color(0xfffe645a);

  static final ThemeData _themeData = themeDataInit();

  ThemeData get themeData => _themeData;

  static ThemeData themeDataInit() {
    var themeData = ThemeData.dark(useMaterial3: true);
    return themeData.copyWith(
      textTheme: themeData.textTheme
          .copyWith(
            headlineLarge: themeData.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            titleLarge: themeData.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: themeData.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            labelLarge: themeData.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          )
          .apply(
            fontFamily: 'Montserrat',
            displayColor: white,
            bodyColor: white,
            // decoration: white,
            decorationColor: white,
            // decorationStyle: white,
          ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          maximumSize: Size.infinite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      buttonTheme: themeData.buttonTheme.copyWith(
          // buttonColor: Colors.red,
          // disabledColor: Colors.red,
          // focusColor: Colors.red,
          // hoverColor: Colors.red,
          // highlightColor: Colors.red,
          // splashColor: Colors.red,
          ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      // backgroundColor: Colors.red,
      // ),
      // ),
      canvasColor: primaryColor,
      // cardColor: Colors.red,
      // dialogBackgroundColor: Colors.red,
      // disabledColor: Colors.red,
      // dividerColor: Colors.red,
      // focusColor: Colors.red,
      // highlightColor: Colors.red,
      // hintColor: Colors.red,
      // hoverColor: Colors.red,
      // indicatorColor: Colors.red,
      // primaryColor: primaryColor,
      // primaryColorDark: Colors.red,
      // primaryColorLight: Colors.red,
      scaffoldBackgroundColor: background,
      // secondaryHeaderColor: Colors.red,
      // shadowColor: Colors.red,
      // splashColor: Colors.red,
      // unselectedWidgetColor: Colors.red,
      colorScheme: themeData.colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: white,
        // primaryContainer: Colors.red,
        onPrimaryContainer: white,
        // secondary: Colors.red,
        // onSecondary: Colors.red,
        // secondaryContainer: Colors.red,
        // onSecondaryContainer: Colors.red,
        // tertiary: Colors.red,
        // onTertiary: Colors.red,
        // tertiaryContainer: Colors.red,
        // onTertiaryContainer: Colors.red,
        error: error,
        // onError: Colors.red,
        // errorContainer: Colors.red,
        // onErrorContainer: Colors.red,
        // background: Colors.red,
        // onBackground: Colors.red,
        surface: background,
        onSurface: onSurface,
        // surfaceVariant: Colors.red,
        onSurfaceVariant: white,
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
