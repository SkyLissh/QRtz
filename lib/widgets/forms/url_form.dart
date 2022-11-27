import "package:flutter/material.dart";
import "package:validators/validators.dart";

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.url,
      validator: _urlValidator,
      decoration: const InputDecoration(
        hintText: "https://www.google.com",
      ),
    );
  }
}
