import "package:flutter/material.dart";

import "package:qr_scanner/widgets/widgets.dart";

class DialogActions extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;

  const DialogActions({
    Key? key,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Expanded(
        child: TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text("Cancel"),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: GradientButton(
          onPressed: onPressed,
          child: Text(textButton),
        ),
      ),
    ]);
  }
}
