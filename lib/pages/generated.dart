import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";
import "package:qr_flutter/qr_flutter.dart";

import "package:qr_scanner/models/models.dart";
import "package:qr_scanner/widgets/widgets.dart";

class GeneratedPage extends StatelessWidget {
  const GeneratedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qr = ModalRoute.of(context)?.settings.arguments as QRCode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Generated"),
        leading: IconButton(
          splashRadius: 24,
          onPressed: () => Navigator.pop(context),
          icon: const FeatherIcon(
            FeatherIcons.chevronLeft,
            size: 32,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: QrImage(data: qr.data, size: 200),
            ),
            const SizedBox(height: 86),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Card(
                  child: DialogBody(
                    title: Text(stringQRType[qr.type]!),
                    content: Text(qr.data),
                  ),
                ),
                Positioned(top: -32, child: QRIcon(type: qr.type, size: 64)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
