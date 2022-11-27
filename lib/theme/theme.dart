import "package:flutter/material.dart";
import "package:qr_scanner/constants/constants.dart";

import "package:qr_scanner/theme/appbar.dart";
import "package:qr_scanner/theme/bottombar.dart";
import "package:qr_scanner/theme/card.dart";
import "package:qr_scanner/theme/chip.dart";
import "package:qr_scanner/theme/dialog.dart";
import "package:qr_scanner/theme/input.dart";
import "package:qr_scanner/theme/tabbar.dart";
import "package:qr_scanner/theme/textbutton.dart";

class MyTheme {
  static final light = _light();
  static final dark = _dark();

  static ThemeData _light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kBackgroundColor,
      colorScheme: const ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        onBackground: kTextColor,
        background: kBackgroundColor,
        surface: kComponentColor,
        onSurface: kTextColor,
      ),
      appBarTheme: MyAppBarTheme.light,
      bottomNavigationBarTheme: MyBottomBarTheme.light,
      tabBarTheme: MyTabBarTheme.light,
      textButtonTheme: MyTextButtonTheme.light,
      dialogTheme: MyDialogTheme.light,
      cardTheme: MyCardTheme.light,
      chipTheme: MyChipTheme.light,
      inputDecorationTheme: MyInputTheme.light,
    );
  }

  static ThemeData _dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: kDarkPrimaryColor,
      scaffoldBackgroundColor: kDarkBackgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: kDarkPrimaryColor,
        secondary: kDarkSecondaryColor,
        onBackground: kDarkTextColor,
        background: kDarkBackgroundColor,
        surface: kDarkComponentColor,
        onSurface: kDarkTextColor,
      ),
      appBarTheme: MyAppBarTheme.dark,
      bottomNavigationBarTheme: MyBottomBarTheme.dark,
      tabBarTheme: MyTabBarTheme.dark,
      textButtonTheme: MyTextButtonTheme.dark,
      dialogTheme: MyDialogTheme.dark,
      cardTheme: MyCardTheme.dark,
      chipTheme: MyChipTheme.dark,
      inputDecorationTheme: MyInputTheme.dark,
    );
  }
}
