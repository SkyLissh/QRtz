import "package:flutter/material.dart";

export "ligth.dart";
export "dark.dart";

extension ColorExtension on Color {
  String toHex() {
    return "#${value.toRadixString(16).padLeft(8, "0")}";
  }
}
