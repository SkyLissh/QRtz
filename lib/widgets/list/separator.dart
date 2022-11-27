import "package:flutter/material.dart";
import "package:intl/intl.dart";

class Separator extends StatelessWidget {
  final DateTime date;
  static final DateTime _today = DateTime.now();

  const Separator({Key? key, required this.date}) : super(key: key);

  String _formatDate() {
    if (date.difference(_today).inDays == 0) {
      return "Today";
    } else if (date.difference(_today).inDays == -1) {
      return "Yesterday";
    } else if (date.difference(_today).inDays >= -7) {
      return DateFormat.EEEE().format(date);
    } else if (date.year == _today.year) {
      return DateFormat.MMMMd().format(date);
    }

    return DateFormat.yMMMMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(label: Text(_formatDate())),
    );
  }
}
