import "package:flutter/material.dart";

import "package:qr_scanner/constants/constants.dart";

class MyDialogTheme {
  static final light = _light();
  static final dark = _dark();

  static DialogTheme _base() {
    return const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );
  }

  static DialogTheme _light() {
    return _base().copyWith(
      backgroundColor: kBackgroundColor,
      titleTextStyle: const TextStyle(
        color: kPrimaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: const TextStyle(
        color: kTextColor,
        fontSize: 16.0,
      ),
    );
  }

  static DialogTheme _dark() {
    return _base().copyWith(
      backgroundColor: kDarkBackgroundColor,
      titleTextStyle: const TextStyle(
        color: kDarkPrimaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: const TextStyle(
        color: kDarkTextColor,
        fontSize: 16.0,
      ),
    );
  }
}
