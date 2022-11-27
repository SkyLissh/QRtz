import "package:flutter/material.dart";

import "package:mask_text_input_formatter/mask_text_input_formatter.dart";
import "package:validators/validators.dart";

import "country_dropdown.dart";

class PhoneForm extends StatefulWidget {
  const PhoneForm({Key? key}) : super(key: key);

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  String _code = "1";

  final _mask = MaskTextInputFormatter(
      mask: "(###) ###-####",
      filter: {"#": RegExp(r"[0-9]")},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    super.initState();
  }

  String? _validator(String? value) {
    final number = _mask.getUnmaskedText();

    if (number.isEmpty) {
      return "Phone number is required";
    }

    if (!isNumeric(number) || number.length < 10) {
      return "Phone number is invalid";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      inputFormatters: [_mask],
      validator: _validator,
      decoration: InputDecoration(
        hintText: "(555) 555-5555",
        prefixIcon: CountryDropdown(
          onSelect: (country) => setState(() {
            _code = country.phoneCode;
          }),
        ),
      ),
    );
  }
}
