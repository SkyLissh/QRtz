import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:validators/validators.dart";

import "package:qr_scanner/models/models.dart";
import "package:qr_scanner/providers/providers.dart";

import "text_area_field.dart";

class EmailForm extends StatefulWidget {
  const EmailForm({Key? key}) : super(key: key);

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

  String? _mailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    if (!isEmail(value)) {
      return "Please enter a valid email";
    }

    return null;
  }

  void _onSaved(BuildContext context) {
    final history = context.read<HistoryNotifier>();

    final mailto = Uri(
      scheme: "mailto",
      path: _emailController.text,
      queryParameters: {
        "subject": _subjectController.text,
        "body": _bodyController.text,
      },
    ).toString();

    final generated = QRCode.fromData(mailto);
    history.add(mailto);
    Navigator.pushNamed(context, "generated", arguments: generated);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: _mailValidator,
        controller: _emailController,
        decoration: const InputDecoration(
          hintText: "Email",
        ),
      ),
      const SizedBox(height: 16),
      TextAreaField(
        maxLines: 1,
        controller: _subjectController,
        hintText: "Subject",
        message: "Please enter a subject",
      ),
      const SizedBox(height: 16),
      TextAreaField(
        controller: _bodyController,
        hintText: "Message",
        onSaved: (value) => _onSaved(context),
        message: "Please enter a message",
      ),
    ]);
  }
}
