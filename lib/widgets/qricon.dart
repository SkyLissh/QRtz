import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

import "package:qr_scanner/models/models.dart";
import "package:qr_scanner/widgets/widgets.dart";

class QRIcon extends StatelessWidget {
  final QRType type;
  final double size;

  const QRIcon({Key? key, required this.type, this.size = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case QRType.text:
        return SquareIcon(
          color: Colors.purple,
          icon: FeatherIcons.type,
          size: size,
        );
      case QRType.url:
        return SquareIcon(
          color: Colors.blue,
          icon: FeatherIcons.globe,
          size: size,
        );
      case QRType.email:
        return SquareIcon(
          color: Colors.red,
          icon: FeatherIcons.mail,
          size: size,
        );
      case QRType.phone:
        return SquareIcon(
          color: Colors.green,
          icon: FeatherIcons.phone,
          size: size,
        );
      case QRType.sms:
        return SquareIcon(
            color: Colors.orange, icon: FeatherIcons.messageCircle, size: size);
      case QRType.wifi:
        return SquareIcon(
            color: Colors.teal, icon: FeatherIcons.wifi, size: size);
      case QRType.geo:
        return SquareIcon(
            color: Colors.pink, icon: FeatherIcons.mapPin, size: size);
      case QRType.contact:
        return SquareIcon(
            color: Colors.amber, icon: FeatherIcons.user, size: size);
      case QRType.calendar:
        return SquareIcon(
            color: Colors.cyan, icon: FeatherIcons.calendar, size: size);
      case QRType.unknown:
        return SquareIcon(
            color: Colors.grey, icon: FeatherIcons.file, size: size);
      case QRType.instagram:
        return SquareIcon(
            color: Colors.pink, icon: FeatherIcons.instagram, size: size);
      case QRType.facebook:
        return SquareIcon(
            color: Colors.blue, icon: FeatherIcons.facebook, size: size);
      case QRType.twitter:
        return SquareIcon(
            color: Colors.blue, icon: FeatherIcons.twitter, size: size);
      case QRType.youtube:
        return SquareIcon(
            color: Colors.red, icon: FeatherIcons.youtube, size: size);
      case QRType.linkedin:
        return SquareIcon(
            color: Colors.blue, icon: FeatherIcons.linkedin, size: size);
      case QRType.github:
        return SquareIcon(
            color: Colors.blueGrey, icon: FeatherIcons.github, size: size);
      case QRType.twitch:
        return SquareIcon(
            color: Colors.purple, icon: FeatherIcons.twitch, size: size);
    }
  }
}
