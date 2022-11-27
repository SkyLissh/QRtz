import "package:flutter/material.dart";

import "text_area_field.dart";

class TextForm extends StatelessWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextAreaField(
      maxLines: 5,
      hintText: "Some text",
      message: "Please enter some text",
    );
  }
}
