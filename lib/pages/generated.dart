import "package:flutter/material.dart";
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
        leading: const ReturnButton(),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: QrImage(data: qr.data, size: 200),
              ),
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
