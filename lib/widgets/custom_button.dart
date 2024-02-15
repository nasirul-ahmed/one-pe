// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../_helpers/size_utils.dart';
import '../_helpers/themes/my_colors.dart';
import '../providers/theme_manager.dart';
import 'custom_container.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final bool? isEnabled;
  final GestureTapCallback? onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  const CustomButton(
      {super.key,
      required this.label,
      this.isEnabled,
      this.onPressed,
      this.buttonHeight,
      this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.themeMode == ThemeMode.dark;

    Gradient activeGradient = isDarkTheme
        ? MyColors.activeGradientDark
        : MyColors.activeGradientLight;
    Gradient inActiveGradient = isDarkTheme
        ? MyColors.inActiveGradientDark
        : MyColors.inActiveGradientLight;

    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: InkWell(
        highlightColor: Colors.blue.withOpacity(0),
        splashColor: Colors.green.withOpacity(0),
        onTap: isEnabled == true ? onPressed : null,
        child: Container(
          width: buttonWidth ?? (width - setWidth(50)),
          height: buttonHeight ?? setHeight(60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: isEnabled == true ? activeGradient : inActiveGradient,
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: "Noto Sans",
                    fontWeight: FontWeight.w600,
                    fontSize: setHeight(18),
                    color: isEnabled == true
                        ? MyColors.fromHex("ffffff")
                        : MyColors.fromHex("ffffff").withOpacity(0.5),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final String buttonText;
  final Function onPressed;
  final double? height;
  final double? width;
  final TextAlign? textAlign;
  final bool? softWrap;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.buttonText,
    required this.onPressed,
    this.height,
    this.width,
    this.textAlign,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    Color textColor =
        themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black;
    return MaterialButton(
      onPressed: () => onPressed(),
      child: CustomContainer(
        height: setHeight(height ?? 100),
        width: setWidth(width ?? 87),
        // borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Container(
              alignment: Alignment.center,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  buttonText,
                  softWrap: softWrap ?? true,
                  textAlign: textAlign ?? TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 11,
                        color: textColor,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
