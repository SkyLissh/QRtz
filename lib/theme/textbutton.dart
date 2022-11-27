import "package:flutter/material.dart";
import 'package:qr_scanner/constants/colors/colors.dart';

class MyTextButtonTheme {
  static final light = _light();
  static final dark = _dark();

  static TextButtonThemeData _light() {
    return TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kComponentColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }

  static TextButtonThemeData _dark() {
    return TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kDarkComponentColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
