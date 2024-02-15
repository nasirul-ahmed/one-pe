import 'package:flutter/material.dart';
import '../_helpers/size_utils.dart';
import '../_helpers/themes/my_colors.dart';

class CustomDotWidget extends StatelessWidget {
  final double? padding;
  final double height;
  final double width;
  final Widget? child;
  final Color? color;

  const CustomDotWidget({
    super.key,
    required this.height,
    required this.width,
    this.padding,
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      padding: getPadding(all: padding),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 44, 49, 0.85),
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color ?? MyColors.green,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
