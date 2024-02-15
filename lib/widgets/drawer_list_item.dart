import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../_helpers/size_utils.dart';
import '../_helpers/themes/my_colors.dart';
import '../_helpers/utils.dart';
import '../providers/theme_manager.dart';

class DrawerListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onClick;
  final IconData? trailing;
  final Widget? trailingNotification;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  const DrawerListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onClick,
    this.trailing,
    this.trailingNotification,
    this.padding,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.themeMode == ThemeMode.dark;
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        padding: padding ?? getPadding(all: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: setHeight(25),
                  // color: isDarkTheme ? MyColors.darkText : MyColors.lightText,
                ),
                space(12, 0),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: fontSize ?? setWidth(16),
                      ),
                )
              ],
            ),
            trailing != null
                ? Icon(
                    trailing,
                    size: setHeight(25),
                  )
                : trailingNotification != null
                    ? trailingNotification!
                    : const SizedBox()
          ],
        ),
      ),
    );
  }
}
