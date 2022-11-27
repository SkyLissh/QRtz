import "package:flutter/material.dart";

import "package:qr_scanner/constants/constants.dart";

class MyCardTheme {
  static final light = _light();
  static final dark = _dark();

  static CardTheme _base() {
    return CardTheme(
      margin: EdgeInsets.zero,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  static CardTheme _light() {
    return _base().copyWith(
      color: kComponentColor,
      shadowColor: kSecondaryColor.withOpacity(0.5),
    );
  }

  static CardTheme _dark() {
    return _base().copyWith(
      color: kDarkComponentColor,
      shadowColor: Colors.deepPurple[900]!.withOpacity(0.5),
    );
  }
}
