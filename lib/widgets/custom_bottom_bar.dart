import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../_helpers/size_utils.dart';
import '../_helpers/themes/my_colors.dart';

class CustomBottomBar extends StatefulWidget {
  final List<TabItem> items;
  final Function(BuildContext, int) onClick;
  final int currentIndex;
  final TabController? controller;
  const CustomBottomBar({
    super.key,
    required this.items,
    this.controller,
    required this.onClick,
    required this.currentIndex,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    print("screen ${widget.currentIndex}");
    // const _bgColor = MyColors.white;
    return StyleProvider(
      style: Style(),
      child: ConvexAppBar.builder(
        curve: Curves.easeIn,
        // items: widget.items,
        // controller: widget.controller,
        disableDefaultTabController: true,
        count: 3,
        elevation: 10,
        height: setHeight(68),
        top: -20.0,
        initialActiveIndex: widget.currentIndex,
        gradient: MyColors.myBg,
        shadowColor: Colors.white,
        cornerRadius: 12,
        onTap: (int idx) => widget.onClick(context, idx),
        itemBuilder: CustomBuilder(items: widget.items, bgColor: Colors.red),
      ),
    );
  }
}

class CustomBuilder extends DelegateBuilder {
  final Color bgColor;
  final List<TabItem> items;
  CustomBuilder({required this.bgColor, required this.items});

  @override
  Widget build(BuildContext context, int index, bool active) {
    var navigationItem = items[index];
    var _color = active ? bgColor : Colors.white70;

    if (index == items.length ~/ 2) {
      return Container(
        height: setHeight(50),
        child: Icon(
          navigationItem.icon,
          color: _color,
          size: 60,
        ),
      );
    }

    var _icon = active
        ? navigationItem.activeIcon ?? navigationItem.icon
        : navigationItem.icon;

    return Container(
      height: setHeight(50),
      child: Icon(
        _icon,
        color: _color,
      ),
    );
  }

  @override
  bool fixed() {
    return true;
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 60;

  @override
  double get activeIconMargin => 5;

  @override
  double get iconSize => 40;

  @override
  TextStyle textStyle(Color color, String? s) {
    return TextStyle(
      fontSize: 20,
      color: color,
    );
  }
}
