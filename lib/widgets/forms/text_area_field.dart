import "package:flutter/material.dart";

class TextAreaField extends StatelessWidget {
  final String hintText;
  final String? message;
  final int maxLines;

  const TextAreaField({
    Key? key,
    required this.hintText,
    this.message,
    this.maxLines = 4,
  }) : super(key: key);

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return message;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: maxLines,
      validator: _validator,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
