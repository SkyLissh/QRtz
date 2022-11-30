import "package:flutter/material.dart";

import "package:qr_scanner/models/models.dart";
import "package:qr_scanner/widgets/widgets.dart";

class ItemDialog extends StatefulWidget {
  final QRType type;

  const ItemDialog({Key? key, required this.type}) : super(key: key);

  @override
  State<ItemDialog> createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, true);
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              DialogBody(
                title: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(stringQRType[widget.type]!),
                ),
                content: QRForm(type: widget.type),
                actions: DialogActions(
                  textButton: "Generate",
                  onPressed: _onSubmit,
                ),
              ),
              Positioned(top: -30, child: QRIcon(type: widget.type, size: 64)),
            ],
          ),
        ),
      ),
    );
  }
}
