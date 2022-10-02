import 'package:flutter/material.dart';
import 'package:starlight/styles/starlight_colors.dart';

/// ThemeData for Personal styles for the app
class ThemeDataStarLight {
  final BuildContext context;
  ThemeDataStarLight({required this.context});

  late ThemeData starDark = ThemeData.dark().copyWith(
    primaryColor: StarLightColors.lightBlue,
    backgroundColor: StarLightColors.starPrimaryBlue,

    /// * Change color of Scaffold
    scaffoldBackgroundColor: StarLightColors.starPrimaryBlue,

    appBarTheme: AppBarTheme(
      backgroundColor: StarLightColors.starSecondaryBlue,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: StarLightColors.starSecondaryBlue,
    ),
  );
}
