import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:qr_scanner/models/models.dart";
import "package:qr_scanner/providers/providers.dart";

import "text_area_field.dart";

class TextForm extends StatelessWidget {
  const TextForm({Key? key}) : super(key: key);

  void _onSaved(BuildContext context, String? value) {
    final history = context.read<HistoryNotifier>();

    final generated = QRCode.fromData(value!);
    history.add(value);
    Navigator.pushNamed(context, "generated", arguments: generated);
  }

  @override
  Widget build(BuildContext context) {
    return TextAreaField(
      maxLines: 5,
      onSaved: (value) => _onSaved(context, value),
      hintText: "Some text",
      message: "Please enter some text",
    );
  }
}
