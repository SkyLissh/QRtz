import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

import "package:qr_scanner/constants/constants.dart";

class EmptyHistory extends StatelessWidget {
  final String title;
  final String subtitle;
  final FeatherIcons icon;

  const EmptyHistory({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FeatherIcon(
            icon,
            color: kPrimaryColor.withOpacity(0.5),
            size: 64.0,
          ),
          const SizedBox(height: 16.0),
          Text(
            title,
            style: kSubtitleStyle.copyWith(
              color: context.isDark
                  ? kDarkTextSecondaryColor
                  : kTextSecondaryColor,
            ),
          ),
          Text(
            subtitle,
            style: kCaptionStyle,
          ),
        ],
      ),
    );
  }
}
