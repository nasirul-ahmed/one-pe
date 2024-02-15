import '/_helpers/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../_helpers/size_utils.dart';
import '../_helpers/themes/themes.dart';
import '../providers/theme_manager.dart';

class CustomTextInput extends StatefulWidget {
  final String? hintText;
  final IconButton? suffixIcon;
  final Image? prefixIcon;
  final Function(String)? onChange;
  final MyButtonColors? color;
  final TextEditingController? controller;
  final TextInputType inputType;
  final bool hideText;
  final Function(String?)? validator;
  final TextInputType? keyboardType;
  final onTap;

  const CustomTextInput(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.onChange,
      this.controller,
      this.hideText = false,
      this.inputType = TextInputType.text,
      this.color = MyButtonColors.white,
      this.validator,
      this.keyboardType,
      this.onTap})
      : assert(hintText != null, 'hintText must be provided.');

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.themeMode == ThemeMode.dark;

    return SizedBox(
      // width: setWidth(340),
      // height: setHeight(45),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: widget.hideText,
        onChanged: widget.onChange,
        onTap: widget.onTap,
        onTapOutside: (PointerDownEvent e) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        // cursorColor: Colors.white,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: "Source Sans Pro",
              fontWeight: FontWeight.w400,
              fontSize: setHeight(17),
            ),
        maxLines: 1,
        decoration: InputDecoration(
          fillColor: isDarkTheme
              ? Colors.transparent.withOpacity(0.1)
              : Colors.white.withOpacity(0.4),
          // errorBorder: enabledBorder,
          // focusedErrorBorder: focusedBorder,
          // focusedBorder: focusedBorder,
          // enabledBorder: enabledBorder,
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: "Source Sans Pro",
                fontWeight: FontWeight.w400,
                fontSize: setHeight(17),
              ),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          // border:
        ),
        validator: (v) => widget.validator!(v),
      ),
    );
  }
}
