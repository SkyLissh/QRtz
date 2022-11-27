import "package:flutter/material.dart";
import "package:grouped_list/grouped_list.dart";

import "package:qr_scanner/models/models.dart";
import "separator.dart";
import "list_item.dart";

class ListQR extends StatelessWidget {
  final List<QRScanned> items;
  final Function(String)? onDismissed;

  const ListQR({Key? key, required this.items, this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupedListView(
      elements: items,
      groupBy: (element) => element.date.toString().substring(0, 10),
      groupSeparatorBuilder: (String date) =>
          Separator(date: DateTime.parse(date)),
      itemBuilder: (context, element) => ListItem(
        item: element,
        onDismissed: onDismissed,
      ),
      order: GroupedListOrder.DESC,
    );
  }
}
