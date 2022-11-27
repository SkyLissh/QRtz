import "package:flutter/material.dart";

import "package:qr_scanner/constants/constants.dart";

class MyInputTheme {
  static final light = _light();
  static final dark = _dark();

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kPrimaryColor),
  );

  static InputDecorationTheme _base() {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: _border.copyWith(borderSide: BorderSide.none),
      border: _border,
      errorBorder: _border,
      focusedBorder: _border,
      filled: true,
      hintStyle: const TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }

  static InputDecorationTheme _light() {
    return _base().copyWith(
      fillColor: kComponentColor,
    );
  }

  static InputDecorationTheme _dark() {
    return _base().copyWith(
      fillColor: kDarkComponentColor,
    );
  }
}
