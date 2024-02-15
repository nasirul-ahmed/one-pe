import '/_helpers/size_utils.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double height;
  final double? width;
  final BorderRadius? borderRadius;
  final double? padding;
  final Function? callback;
  const CustomContainer(
      {super.key,
      this.child,
      this.color,
      required this.height,
      this.width,
      this.borderRadius,
      this.padding,
      this.callback});

  @override
  Widget build(BuildContext context) {
    var decoration = color != null
        ? BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          )
        : BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(0),
          );
    return Container(
      height: setHeight(height),
      width: width != null ? setWidth(width!) : double.infinity,
      decoration: decoration,
      child: child ?? const SizedBox(),
    );
  }
}
