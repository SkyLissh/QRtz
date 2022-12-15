import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "package:qr_scanner/constants/constants.dart";

class FloatingButton extends StatelessWidget {
  final Widget icon;
  final Widget? label;
  final VoidCallback? onTap;

  const FloatingButton({
    Key? key,
    required this.icon,
    this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 56,
        minHeight: 56,
      ),
      // width: 60,
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
            child: label == null
                ? icon
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      icon,
                      const SizedBox(width: 12),
                      DefaultTextStyle(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          child: label!)
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
