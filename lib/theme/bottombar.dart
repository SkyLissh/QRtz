import "package:flutter/material.dart";

import "package:qr_scanner/constants/constants.dart";

class MyBottomBarTheme {
  static final light = _light();
  static final dark = _dark();

  static BottomNavigationBarThemeData _base() {
    return const BottomNavigationBarThemeData(
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  static BottomNavigationBarThemeData _light() {
    return _base().copyWith(
      backgroundColor: kBackgroundColor,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kTextSecondaryColor,
    );
  }

  static BottomNavigationBarThemeData _dark() {
    return _base().copyWith(
      backgroundColor: kDarkBackgroundColor,
      selectedItemColor: kDarkPrimaryColor,
      unselectedItemColor: kDarkTextSecondaryColor,
    );
  }
}
