import "package:flutter/material.dart";

import "package:qr_scanner/constants/constants.dart";

class MyTabBarTheme {
  static final light = _light();
  static final dark = _dark();

  static const _borderSide = BorderSide(width: 3);

  static TabBarTheme _base() {
    return const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TabBarTheme _light() {
    return _base().copyWith(
      labelColor: kPrimaryColor,
      unselectedLabelColor: kTextColor,
      indicator: UnderlineTabIndicator(
        borderSide: _borderSide.copyWith(color: kPrimaryColor),
      ),
    );
  }

  static TabBarTheme _dark() {
    return _base().copyWith(
      labelColor: kDarkPrimaryColor,
      unselectedLabelColor: kDarkTextColor,
      indicator: UnderlineTabIndicator(
        borderSide: _borderSide.copyWith(color: kDarkPrimaryColor),
      ),
    );
  }
}
