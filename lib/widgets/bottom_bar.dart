import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;

  const BottomBar({Key? key, this.currentIndex = 0, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: FeatherIcon(FeatherIcons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: FeatherIcon(FeatherIcons.grid),
          label: "Map",
        ),
      ],
    );
  }
}
