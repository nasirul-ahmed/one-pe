import 'package:flutter/material.dart';
import '../_helpers/size_utils.dart';
import '../_helpers/themes/my_colors.dart';

class CustomCard extends StatelessWidget {
  final double height;
  final double width;
  final Color? bgColor;
  final double? borderRadius;
  final Widget child;
  final Border? border;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  const CustomCard({
    super.key,
    this.bgColor,
    this.borderRadius,
    required this.child,
    required this.height,
    required this.width,
    this.border,
    this.gradient,
    this.padding,
  });
  @override
  Widget build(BuildContext context) {
    double _width = setWidth(width);
    double _height = setHeight(height);
    if (border != null) {
      return Container(
        height: _height,
        width: _width,
        padding: padding ?? const EdgeInsets.all(0),
        decoration: BoxDecoration(
          border: border,
          color: bgColor ?? MyColors.transparant.withOpacity(0.08),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: child,
      );
    }
    if (gradient != null) {
      return Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          // color: bgColor ?? MyColors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          gradient: gradient,
        ),
        child: child,
      );
    }
    return Container(
      height: setHeight(_height),
      width: setWidth(_width),
      decoration: BoxDecoration(
        color: bgColor ?? MyColors.white.withOpacity(0.08),
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      child: child,
    );
  }
}
