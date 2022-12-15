import "package:flutter/material.dart";

import "package:qr_scanner/constants/constants.dart";

class GradientButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const GradientButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(80)),
          gradient: kBackgroundGradient,
        ),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 88.0,
            minHeight: 36.0,
          ),
          alignment: Alignment.center,
          child: DefaultTextStyle(
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              child: child),
        ),
      ),
    );
  }
}
