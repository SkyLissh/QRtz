import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

class ReturnButton extends StatelessWidget {
  const ReturnButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 24,
      onPressed: () => Navigator.pop(context),
      icon: const FeatherIcon(
        FeatherIcons.chevronLeft,
        size: 32,
      ),
    );
  }
}
