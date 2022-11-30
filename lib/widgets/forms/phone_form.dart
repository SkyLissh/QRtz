import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:qr_scanner/models/qrcode.dart";
import "package:qr_scanner/providers/providers.dart";

import "phone_field.dart";

class PhoneForm extends StatelessWidget {
  const PhoneForm({Key? key}) : super(key: key);

  void _onSaved(BuildContext context, String? value) {
    final history = context.read<HistoryNotifier>();

    final generated = QRCode.fromData("tel:$value");
    history.add("tel:$value");
    Navigator.pushNamed(context, "generated", arguments: generated);
  }

  @override
  Widget build(BuildContext context) {
    return PhoneField(
      onSaved: (value) => _onSaved(context, value),
    );
  }
}
