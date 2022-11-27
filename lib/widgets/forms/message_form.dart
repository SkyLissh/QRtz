import "package:flutter/material.dart";

import "phone_form.dart";
import "text_area_field.dart";

class MessageForm extends StatelessWidget {
  const MessageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PhoneForm(),
        SizedBox(height: 16),
        TextAreaField(
          maxLines: 5,
          hintText: "Message",
          message: "Please enter a message",
        ),
      ],
    );
  }
}
