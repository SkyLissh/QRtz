import "package:flutter/material.dart";

import "package:qr_scanner/constants/constants.dart";

class DialogBody extends StatelessWidget {
  final Widget title;
  final Widget content;
  final Widget? actions;

  const DialogBody({
    Key? key,
    required this.title,
    required this.content,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DefaultTextStyle(
              style: kTitleStyle.copyWith(color: colors.primary),
              child: title,
            ),
          ),
          const SizedBox(height: 16),
          DefaultTextStyle(
            style: kSubtitleStyle.copyWith(fontWeight: FontWeight.normal),
            child: content,
          ),
          if (actions != null) ...[
            const SizedBox(height: 24),
            actions!,
          ]
        ],
      ),
    );
  }
}
