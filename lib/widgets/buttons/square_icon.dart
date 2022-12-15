import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

class SquareIcon extends StatelessWidget {
  final MaterialColor color;
  final FeatherIcons icon;
  final double size;

  const SquareIcon({
    Key? key,
    required this.color,
    required this.icon,
    this.size = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: color.shade400, width: 2.0),
        color: color[50],
      ),
      child: Center(
        child: FeatherIcon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
