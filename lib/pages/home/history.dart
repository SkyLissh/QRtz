import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

import "package:qr_scanner/providers/providers.dart";
import "package:qr_scanner/widgets/widgets.dart";

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(children: const [
        TabBar(
          tabs: [
            Tab(text: "Scanned"),
            Tab(text: "Generated"),
          ],
        ),
        Flexible(
          child: TabBarView(children: [
            _Scanned(),
            EmptyHistory(
                icon: FeatherIcons.grid,
                title: "No Generated QR",
                subtitle: "Generate a QR code to see the result here"),
          ]),
        ),
      ]),
    );
  }
}

class _Scanned extends StatelessWidget {
  const _Scanned({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scannedList = context.select((ScannedState h) => h.scanned);
    final scanned = context.read<ScannedNotifier>();

    return scannedList.isEmpty
        ? const EmptyHistory(
            icon: FeatherIcons.maximize,
            title: "No Scanned QR",
            subtitle: "Scan a QR code to see the result here")
        : ListQR(items: scannedList, onDismissed: (id) => scanned.remove(id));
  }
}
