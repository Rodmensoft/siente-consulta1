import 'package:flutter/material.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: ColorTheme.primaryTint,
    appBarTheme: const AppBarTheme(
      color: ColorTheme.primaryTint,
      centerTitle: true,
      // toolbarTextStyle: TextTheme().bodyText2,
      // titleTextStyle: TextTheme().headline6,
    ),
    primarySwatch: Colors.grey,
    primaryTextTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorTheme.light,
      selectionColor: ColorTheme.tertiary,
      selectionHandleColor: ColorTheme.primaryTint,
    ),
    // useTextSelectionTheme: true,
  );
}
