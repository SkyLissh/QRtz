import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_barcode_scanner/flutter_barcode_scanner.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

import "package:qr_scanner/constants/constants.dart";
import "package:qr_scanner/providers/providers.dart";
import "package:qr_scanner/widgets/widgets.dart";

import "package:qr_scanner/pages/home/history.dart";
import "package:qr_scanner/pages/home/generate.dart";

class HomePage extends StatelessWidget {
  static const pages = ["History", "Generate"];
  static const titles = ["Clear Scanned", "Clear Generated"];
  static const messages = [
    "Are you sure you want to clear all scanned QR?",
    "Are you sure you want to clear all generated QR?"
  ];

  const HomePage({Key? key}) : super(key: key);

  void confirmClear(BuildContext context, int page) async {
    final scanned = context.read<HistoryNotifier>();

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmDialog(
        title: titles[page],
        content: messages[page],
      ),
    );

    if (confirm == true) {
      if (page == 0) {
        scanned.clear();
      }
    }
  }

  void saveQR(HistoryNotifier scanned) async {
    final result = await FlutterBarcodeScanner.scanBarcode(
      kPrimaryColor.toHex(),
      "Cancel",
      false,
      ScanMode.QR,
    );

    if (result != "-1") scanned.add(result);
  }

  @override
  Widget build(BuildContext context) {
    final page = context.select((PageState p) => p.page);
    final setPage = context.read<PageNotifier>().setPage;

    final scanned = context.read<HistoryNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: Text(pages[page]),
        actions: page == 0
            ? [
                IconButton(
                  onPressed: () => confirmClear(context, page),
                  splashRadius: 24.0,
                  icon: const FeatherIcon(FeatherIcons.trash),
                ),
              ]
            : null,
      ),
      body: _CurrentPage(selectedPage: page),
      bottomNavigationBar:
          BottomBar(currentIndex: page, onTap: (idx) => setPage(idx)),
      floatingActionButton: FloatingButton(onTap: () => saveQR(scanned)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _CurrentPage extends StatelessWidget {
  final int selectedPage;

  const _CurrentPage({Key? key, required this.selectedPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedPage,
      children: const [
        HistoryPage(),
        GeneratePage(),
      ],
    );
  }
}
