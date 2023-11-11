import 'package:flutter/material.dart';

const Color _background = Color(0xff151d3d);
const Color _onSurface = Color(0xff1c2755);
const Color _primaryColor = Color(0xff3658D7);
const Color _white = Color(0xffffffff);
const Color _success = Color(0xff107670);
const Color _error = Color(0xfffe645a);


extension ColorSchemeExtension on ColorScheme {
  Color get success  => _success;
}

class AppThemeData {
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
            displayColor: _white,
            bodyColor: _white,
            // decoration: white,
            decorationColor: _white,
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
      canvasColor: _primaryColor,
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
      scaffoldBackgroundColor: _background,
      // secondaryHeaderColor: Colors.red,
      // shadowColor: Colors.red,
      // splashColor: Colors.red,
      // unselectedWidgetColor: Colors.red,
      colorScheme: themeData.colorScheme.copyWith(
        primary: _primaryColor,
        onPrimary: _white,
        // primaryContainer: Colors.red,
        onPrimaryContainer: _white,
        // secondary: Colors.red,
        // onSecondary: Colors.red,
        // secondaryContainer: Colors.red,
        // onSecondaryContainer: Colors.red,
        // tertiary: Colors.red,
        // onTertiary: Colors.red,
        // tertiaryContainer: Colors.red,
        // onTertiaryContainer: Colors.red,
        error: _error,
        // onError: Colors.red,
        // errorContainer: Colors.red,
        // onErrorContainer: Colors.red,
        // background: Colors.red,
        // onBackground: Colors.red,
        surface: _background,
        onSurface: _onSurface,
        // surfaceVariant: Colors.red,
        onSurfaceVariant: _white,
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
