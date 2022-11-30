import "package:flutter/material.dart";
import "package:validators/validators.dart";
import "package:mask_text_input_formatter/mask_text_input_formatter.dart";

import "country_dropdown.dart";

class PhoneField extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String)? onSaved;

  const PhoneField({Key? key, this.onSaved, this.controller}) : super(key: key);

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  String _code = "1";

  final _mask = MaskTextInputFormatter(
      mask: "(###) ###-####",
      filter: {"#": RegExp(r"[0-9]")},
      type: MaskAutoCompletionType.lazy);

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

  void _onSaved(String? value) {
    final number = _mask.getUnmaskedText();
    final generated = "+$_code$number";
    widget.onSaved?.call(generated);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      inputFormatters: [_mask],
      validator: _validator,
      controller: widget.controller,
      onSaved: (value) => _onSaved(value),
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
