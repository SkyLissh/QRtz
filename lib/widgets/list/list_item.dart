import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

import "package:qr_scanner/models/models.dart";
import "package:qr_scanner/constants/constants.dart";
import "package:qr_scanner/widgets/widgets.dart";

class ListItem extends StatelessWidget {
  final QRScanned item;
  final Function(String)? onDismissed;

  const ListItem({
    Key? key,
    required this.item,
    this.onDismissed,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    if (item.type == QRType.text || item.type == QRType.unknown) return;

    final url = Uri.parse(item.data);

    if (!await launchUrl(url)) {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        background: const DismissBackground(),
        onDismissed: (direction) => onDismissed?.call(item.id),
        child: Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: kSecondaryColor.withOpacity(0.2),
            onTap: () => _launchUrl(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                QRIcon(type: item.type),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(stringQRType[item.type]!, style: kSubtitleStyle),
                      Text(item.data,
                          style: kCaptionStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const FeatherIcon(
                  FeatherIcons.chevronRight,
                  color: kPrimaryColor,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
