import '/providers/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../_helpers/themes/my_colors.dart';
import '../_helpers/size_utils.dart';
import '../providers/theme_manager.dart';
import 'custom_dot_widget.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(dynamic)? openSearchDelegate;
  final Function? openDrawer;
  final Widget? leading;
  final Widget? middleContent;
  final Widget? trailing;
  const CustomAppBar({
    super.key,
    this.openDrawer,
    this.leading,
    this.middleContent,
    this.trailing,
    this.openSearchDelegate,
  });

  @override
  Size get preferredSize => Size.fromHeight(setHeight(70));

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var textStyle = Theme.of(context).textTheme;
    var store = Provider.of<Store>(context);

    middleContentWidget(openDrawer) {
      return InkWell(
        onTap: () => openDrawer!(),
        child: RichText(
          text: TextSpan(
            text: 'ONE',
            style: textStyle.bodyMedium!.copyWith(
              letterSpacing: 1.8,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'PE',
                style: textStyle.bodyMedium!.copyWith(
                  color: MyColors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    trailingWidget(openSearchDelegate) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => openSearchDelegate(context),
            icon: const Icon(Icons.search),
          ),
        ],
      );
    }

    return SafeArea(
      child: Container(
        height: widget.preferredSize.height,
        padding: getPadding(all: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            middleContentWidget(widget.openDrawer),
            Container(
              child: Row(
                children: [
                  trailingWidget(widget.openSearchDelegate),
                  IconButton(
                    onPressed: () => themeProvider.toggleTheme(
                      !(themeProvider.themeMode == ThemeMode.dark),
                    ),
                    icon: Icon(
                      themeProvider.themeMode == ThemeMode.dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                  ),
                  Stack(
                      // fit: StackFit.passthrough,
                      children: [
                        IconButton(
                          onPressed: () => widget.openDrawer!(),
                          icon: const Icon(
                            Icons.notifications,
                          ),
                        ),
                        store.anyNotification
                            ? const Positioned(
                                right: 13,
                                bottom: 14,
                                child: CustomDotWidget(
                                  height: 8,
                                  width: 8,
                                  padding: 1,
                                  color: MyColors.red,
                                ),
                              )
                            : const SizedBox(),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
