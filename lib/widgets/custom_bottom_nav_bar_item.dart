import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBarItem extends TabItem {
  final String initialLocation;

  const CustomBottomNavBarItem({
    required this.initialLocation,
    required IconData icon,
    String? label,
    Widget? activeIcon,
  }) : super(icon: icon, activeIcon: activeIcon ?? icon);
}
