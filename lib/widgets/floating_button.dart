import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "package:qr_scanner/constants/constants.dart";

class FloatingButton extends StatelessWidget {
  final VoidCallback? onTap;

  const FloatingButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: kBackgroundGradient,
        boxShadow: [
          BoxShadow(
            color: kSecondaryColor.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 4,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: kSecondaryColor,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
