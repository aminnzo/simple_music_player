import 'package:flutter/material.dart';
import 'package:simple_music_player/app/ui/theme/colors.dart';
import 'package:simple_music_player/app/ui/theme/fonts.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => _theme(false);

  static ThemeData darkTheme() => _theme(true);

  static ThemeData _theme(bool isDarkMode) {
    return ThemeData(
      fontFamily: Fonts.Montserrat,
      // appBarTheme: AppBarTheme(brightness: Brightness.dark),
      canvasColor: Colors.black,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.dark,
        background: ColorsBase.background,
        primary: ColorsBase.primary,
        secondary: ColorsBase.accent,
        error: ColorsBase.error,
      ),
    );
  }
}
