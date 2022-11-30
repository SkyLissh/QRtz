import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

import "package:qr_scanner/providers/providers.dart";
import "package:qr_scanner/widgets/widgets.dart";

class ClearButton extends StatelessWidget {
  const ClearButton({Key? key}) : super(key: key);

  static const _titles = ["Clear Scanned", "Clear Generated"];
  static const _messages = [
    "Are you sure you want to clear all scanned QR?",
    "Are you sure you want to clear all generated QR?"
  ];

  void _showConfirm(BuildContext context, int tab) async {
    final history = context.read<HistoryNotifier>();

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmDialog(
        title: _titles[tab],
        content: _messages[tab],
      ),
    );

    if (confirm != true) return;

    if (tab == 0) {
      history.clearScanned();
    } else {
      history.clearGenerated();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tab = context.select((NavState t) => t.tab);

    return IconButton(
      onPressed: () => _showConfirm(context, tab),
      splashRadius: 24.0,
      icon: const FeatherIcon(FeatherIcons.trash),
    );
  }
}
