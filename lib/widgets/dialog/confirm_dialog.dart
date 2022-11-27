import "package:flutter/material.dart";

import "package:qr_scanner/widgets/widgets.dart";

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;

  const ConfirmDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: DialogBody(
        title: Text(title),
        content: Text(content),
        actions: DialogActions(
          textButton: "Delete",
          onPressed: () => Navigator.pop(context, true),
        ),
      ),
    );
  }
}
