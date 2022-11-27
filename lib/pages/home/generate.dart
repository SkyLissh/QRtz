import "package:flutter/material.dart";

import "package:qr_scanner/constants/constants.dart";
import "package:qr_scanner/models/models.dart";
import "package:qr_scanner/widgets/widgets.dart";

class GeneratePage extends StatelessWidget {
  const GeneratePage({Key? key}) : super(key: key);

  Future<void> _showDialog(BuildContext context, QRType type) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => ItemDialog(type: type),
    );

    print(confirm);
  }

  @override
  Widget build(BuildContext context) {
    final typesQR = QRType.values
        .where((element) => element != QRType.unknown)
        .where((element) => element != QRType.facebook)
        .where((element) => element != QRType.linkedin)
        .where((element) => element != QRType.github)
        .where((element) => element != QRType.twitch)
        .where((element) => element != QRType.twitter)
        .where((element) => element != QRType.instagram)
        .where((element) => element != QRType.youtube)
        .toList();

    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      children: typesQR.map((type) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              splashColor: kSecondaryColor.withOpacity(0.2),
              onTap: () => _showDialog(context, type),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QRIcon(type: type, size: 64),
                  const SizedBox(height: 16),
                  Text(
                    stringQRType[type]!,
                    style: kSubtitleStyle,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
