import "package:flutter/material.dart";
import "package:validators/validators.dart";

import 'package:qr_scanner/models/qrcode.dart';

class UrlForm extends StatelessWidget {
  const UrlForm({Key? key}) : super(key: key);

  String? _urlValidator(String? value) {
    final validUrl = isURL(value ?? "", requireProtocol: true);

    if (validUrl) {
      return null;
    } else {
      return "Please enter a valid URL";
    }
  }

  void _onSaved(BuildContext context, String? value) {
    final generated = QRCode.fromData(value!);
    Navigator.pushNamed(context, "generated", arguments: generated);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) => _onSaved(context, value),
      keyboardType: TextInputType.url,
      validator: _urlValidator,
      decoration: const InputDecoration(
        hintText: "https://www.google.com",
      ),
    );
  }
}
