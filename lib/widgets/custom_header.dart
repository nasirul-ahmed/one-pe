import 'package:flutter/material.dart';
import 'package:onepe/providers/theme_manager.dart';
import 'package:provider/provider.dart';
import '../_helpers/size_utils.dart';
import 'custom_container.dart';

class CustomHeader extends StatefulWidget {
  final String title;
  final bool divider;
  const CustomHeader({super.key, required this.title, this.divider = false});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(left: 20, right: 20, top: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          widget.divider
              ? const Divider(
                  thickness: 1,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class CustomHeader2 extends StatelessWidget {
  final String title;
  final Color bgColor;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;
  const CustomHeader2({
    super.key,
    required this.bgColor,
    required this.title,
    this.height,
    this.width,
    this.padding,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeProvider>(context);
    return Container(
      height: setHeight(height ?? 30),
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: themeMode.themeMode == ThemeMode.dark
            ? bgColor.withOpacity(.6)
            : bgColor,
      ),
      padding: padding ?? getPadding(all: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themeMode.themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.black,
                ),
          ),
          trailing ?? const SizedBox()
        ],
      ),
    );
  }
}
