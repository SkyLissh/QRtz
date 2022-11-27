import "package:flutter/material.dart";
import "package:validators/validators.dart";

import "text_area_field.dart";

class EmailForm extends StatelessWidget {
  const EmailForm({Key? key}) : super(key: key);

  String? _mailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    if (!isEmail(value)) {
      return "Please enter a valid email";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: _mailValidator,
        decoration: const InputDecoration(
          hintText: "Email",
        ),
      ),
      const SizedBox(height: 16),
      const TextAreaField(
        maxLines: 1,
        hintText: "Message",
        message: "Please enter a message",
      ),
      const SizedBox(height: 16),
      const TextAreaField(
        hintText: "Message",
        message: "Please enter a message",
      ),
    ]);
  }
}
