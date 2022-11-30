import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:qr_scanner/models/models.dart";
import "package:qr_scanner/providers/providers.dart";

import "phone_field.dart";
import "text_area_field.dart";

class MessageForm extends StatefulWidget {
  const MessageForm({Key? key}) : super(key: key);

  @override
  State<MessageForm> createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  final _message = TextEditingController();

  @override
  void dispose() {
    _message.dispose();

    super.dispose();
  }

  void _onSaved(String value) {
    final history = context.read<HistoryNotifier>();

    final generated = QRCode.fromData("smsto:$value:${_message.text}");
    history.add("smsto:$value:${_message.text}");
    Navigator.pushNamed(context, "generated", arguments: generated);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneField(onSaved: _onSaved),
        const SizedBox(height: 16),
        TextAreaField(
          controller: _message,
          maxLines: 5,
          hintText: "Message",
          message: "Please enter a message",
        ),
      ],
    );
  }
}
