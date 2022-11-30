import "package:flutter/material.dart";

class TextAreaField extends StatelessWidget {
  final String hintText;
  final String? message;
  final int maxLines;
  final TextEditingController? controller;

  final void Function(String?)? onSaved;

  const TextAreaField({
    Key? key,
    required this.hintText,
    this.message,
    this.maxLines = 4,
    this.onSaved,
    this.controller,
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
      textCapitalization: TextCapitalization.sentences,
      maxLines: maxLines,
      controller: controller,
      validator: _validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
