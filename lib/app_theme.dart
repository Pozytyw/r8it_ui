import 'package:flutter/material.dart';

abstract class ColorPalette {
  Color get background;

  Color get onSurface;

  Color get white;

  Color get primaryColor;

  Color get onPrimaryColor;
  Color get gray;
}

final Color _success = Color(0xff107670);
final Color _error = Color(0xfffe645a);
final Color _gray = Color(0xff545454);

class DarkColorPalette implements ColorPalette {
  static final Color _fontColor = Color(0xfff4f5f8);
  static final Color _background = Color(0xff101223);
  static final Color _secondaryColor = Color(0xff0e265e);

  @override
  final Color background = _background;
  @override
  final Color onSurface = _secondaryColor;
  @override
  final Color white = _fontColor;
  @override
  final Color primaryColor = _fontColor;
  @override
  final Color onPrimaryColor = _background;
  @override
  final Color gray = _gray;
}

class LightColorPalette implements ColorPalette {
  static final Color _fontColor = Color(0xff101223);
  static final Color _background = Color(0xfff4f5f8);
  static final Color _secondaryColor = Color(0xffd2d4da);

  @override
  final Color background = _background;
  @override
  final Color onSurface = _secondaryColor;
  @override
  final Color white = _fontColor;
  @override
  final Color primaryColor = _fontColor;
  @override
  final Color onPrimaryColor = _background;
  @override
  final Color gray = _gray;
}

extension ColorSchemeExtension on ColorScheme {
  Color get success {
    return _success;
  }

  Color get gray {
    return _gray;
  }
}

class AppThemeData {
  static final ThemeData _themeData = themeDataInit();

  ThemeData get themeData => _themeData;

  static ThemeData themeDataInit() {
    var themeData = ThemeData.light(useMaterial3: true);
    var palette = LightColorPalette();

    return themeData.copyWith(
      textTheme: themeData.textTheme
          .copyWith(
            headlineLarge: themeData.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
            titleLarge: themeData.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
            bodyLarge: themeData.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
            labelLarge: themeData.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          )
          .apply(
            fontFamily: 'Montserrat',
            displayColor: palette.white,
            bodyColor: palette.white,
            // decoration: white,
            decorationColor: palette.onPrimaryColor,
            // decorationStyle: white,
          ),
      navigationBarTheme: themeData.navigationBarTheme.copyWith(
        height: kBottomNavigationBarHeight,
      ),
      bottomNavigationBarTheme: themeData.bottomNavigationBarTheme.copyWith(
        elevation: 0,
        backgroundColor: palette.onSurface,
        selectedItemColor: palette.primaryColor,
        unselectedItemColor: palette.gray
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
      canvasColor: palette.primaryColor,
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
      scaffoldBackgroundColor: palette.background,
      // secondaryHeaderColor: Colors.red,
      // shadowColor: Colors.red,
      // splashColor: Colors.red,
      // unselectedWidgetColor: Colors.red,
      colorScheme: themeData.colorScheme.copyWith(
        primary: palette.primaryColor,
        onPrimary: palette.onPrimaryColor,
        // primaryContainer: Colors.red,
        onPrimaryContainer: palette.onPrimaryColor,
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
        surface: palette.background,
        onSurface: palette.onSurface,
        // surfaceVariant: Colors.red,
        onSurfaceVariant: palette.white,
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
