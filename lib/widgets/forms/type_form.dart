import "package:flutter/material.dart";

import "package:qr_scanner/models/models.dart";

import "email_form.dart";
import "phone_form.dart";
import "text_form.dart";
import "message_form.dart";
import "url_form.dart";

class QRForm extends StatelessWidget {
  final QRType type;

  const QRForm({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case QRType.url:
        return const UrlForm();
      case QRType.text:
        return const TextForm();
      case QRType.email:
        return const EmailForm();
      case QRType.phone:
        return const PhoneForm();
      case QRType.sms:
        return const MessageForm();
      default:
        return const SizedBox();
    }
  }
}
