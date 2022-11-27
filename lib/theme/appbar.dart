import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "package:qr_scanner/constants/constants.dart";

class MyAppBarTheme {
  static final light = _light();
  static final dark = _dark();

  static const titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static AppBarTheme _base() {
    return const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    );
  }

  static AppBarTheme _light() {
    return _base().copyWith(
      backgroundColor: kBackgroundColor,
      iconTheme: const IconThemeData(color: kPrimaryColor),
      titleTextStyle: titleStyle.copyWith(color: kTextColor),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: kBackgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static AppBarTheme _dark() {
    return _base().copyWith(
      backgroundColor: kDarkBackgroundColor,
      iconTheme: const IconThemeData(color: kDarkPrimaryColor),
      titleTextStyle: titleStyle.copyWith(color: kDarkTextColor),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: kDarkBackgroundColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
