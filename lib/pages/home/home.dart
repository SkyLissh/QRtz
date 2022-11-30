import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_barcode_scanner/flutter_barcode_scanner.dart";

import "package:qr_scanner/constants/constants.dart";
import "package:qr_scanner/providers/providers.dart";
import "package:qr_scanner/widgets/widgets.dart";

import "package:qr_scanner/pages/home/history.dart";
import "package:qr_scanner/pages/home/generate.dart";

class HomePage extends StatelessWidget {
  static const pages = ["History", "Generate"];

  const HomePage({Key? key}) : super(key: key);

  void saveQR(HistoryNotifier history) async {
    final result = await FlutterBarcodeScanner.scanBarcode(
      kPrimaryColor.toHex(),
      "Cancel",
      false,
      ScanMode.QR,
    );

    if (result != "-1") history.add(result);
  }

  @override
  Widget build(BuildContext context) {
    final page = context.select((NavState n) => n.page);
    final nav = context.read<NavNotifier>();

    final history = context.read<HistoryNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: Text(pages[page]),
        actions: page == 0 ? [const ClearButton()] : null,
      ),
      body: IndexedStack(
        index: page,
        children: const [
          HistoryPage(),
          GeneratePage(),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: page,
        onTap: (idx) => nav.setPage(idx),
      ),
      floatingActionButton: FloatingButton(onTap: () => saveQR(history)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
