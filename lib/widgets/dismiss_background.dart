import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

import "package:qr_scanner/constants/constants.dart";

class DismissBackground extends StatelessWidget {
  const DismissBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    final textColor = isDark ? Colors.red[200] : Colors.red[700];

    return Container(
      decoration: BoxDecoration(
        color: Colors.red[300]!.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          FeatherIcon(FeatherIcons.trash, color: textColor),
          const SizedBox(width: 8.0),
          Text("Delete item",
              style: kSubtitleStyle.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
