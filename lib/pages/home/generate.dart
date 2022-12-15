import "package:flutter/material.dart";

import "package:qr_scanner/constants/constants.dart";
import "package:qr_scanner/models/models.dart";
import "package:qr_scanner/widgets/widgets.dart";

class GeneratePage extends StatelessWidget {
  const GeneratePage({Key? key}) : super(key: key);

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
        return _GenerateItem(type: type);
      }).toList(),
    );
  }
}

class _GenerateItem extends StatelessWidget {
  final QRType type;

  const _GenerateItem({Key? key, required this.type}) : super(key: key);

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ItemDialog(type: type),
    );
  }

  void _showMap(BuildContext context) {
    Navigator.pushNamed(context, "map");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          splashColor: kSecondaryColor.withOpacity(0.2),
          onTap: type == QRType.geo
              ? () => _showMap(context)
              : () => _showDialog(context),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            QRIcon(type: type, size: 64),
            const SizedBox(height: 16),
            Text(
              stringQRType[type]!,
              style: kSubtitleStyle,
            ),
          ]),
        ),
      ),
    );
  }
}
