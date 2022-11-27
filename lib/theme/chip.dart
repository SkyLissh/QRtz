import "package:flutter/material.dart";

import "package:qr_scanner/constants/constants.dart";

class MyChipTheme {
  static final light = _light();
  static final dark = _dark();

  static const labelStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static ChipThemeData _base() {
    return const ChipThemeData(
      labelPadding: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      labelStyle: labelStyle,
      secondaryLabelStyle: labelStyle,
    );
  }

  static ChipThemeData _light() {
    return _base().copyWith(
      backgroundColor: kPrimaryColor.withOpacity(0.2),
      labelStyle: labelStyle.copyWith(color: const Color(0xff241727)),
    );
  }

  static ChipThemeData _dark() {
    return _base().copyWith(
      backgroundColor: kPrimaryColor.withOpacity(0.1),
      labelStyle: labelStyle.copyWith(color: kDarkTextColor),
    );
  }
}
