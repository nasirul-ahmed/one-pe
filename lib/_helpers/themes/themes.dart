import 'package:flutter/material.dart';
import '/_helpers/themes/my_colors.dart';

// var lightThemeBoxDecoration = BoxDecoration(
//   gradient: MyColors.linearGradient(
//       Alignment.topCenter,
//       Alignment.bottomCenter,
//       [
//         MyColors.fromHex("#F4F1EF"),
//         MyColors.fromHex("#DFDAD5"),
//         MyColors.fromHex("#EFD8C9")
//       ],
//       3),
// );

// var darkThemeBoxDecoration = BoxDecoration(
//   gradient: MyColors.linearGradient(
//       Alignment.topCenter,
//       Alignment.bottomCenter,
//       [
//         MyColors.fromHex("#121E2D"),
//         MyColors.fromHex("#0B1A1D"),
//         MyColors.fromHex("#0F1823")
//       ],
//       3),
// );

// var _elevatedButton = ElevatedButtonThemeData(
//   style: ButtonStyle(
//     backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff009FD4)),
//     foregroundColor: MaterialStateProperty.all<Color>(const Color(0xffffffff)),
//     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//       RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//         side: BorderSide.none,
//       ),
//     ),
//   ),
// );

// var _btnTheme = ButtonThemeData(
//   buttonColor: MyColors.buttonColor,
//   shape: const RoundedRectangleBorder(),
//   // textTheme: ButtonTextTheme.primary,
//   alignedDropdown: true,
// );

OutlineInputBorder focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  // borderSide: BorderSide(color: MyColors.white.withOpacity(0.2), width: 2),
);

OutlineInputBorder enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  // borderSide: const BorderSide(color: Colors.transparent),
);

const _floatingActionButtonTheme = FloatingActionButtonThemeData(
    // backgroundColor: Color.fromRGBO(61, 68, 123, 1)
    );

const _switchTheme =
    SwitchThemeData(overlayColor: MaterialStatePropertyAll(Colors.amberAccent));

var _inputDecoration = InputDecorationTheme(
  focusColor: MyColors.black900,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(8.0),
  ),
  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
  filled: true,
  // fillColor: const Color.fromRGBO(30, 31, 32, 0.2),
);

ThemeData lightTheme = ThemeData(
  // inputDecorationTheme: _inputDecoration,
  // floatingActionButtonTheme: _floatingActionButtonTheme,
  fontFamily: "Noto Sans",
  brightness: Brightness.light,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  // brightness: Brightness.light,
  // colorScheme: ColorScheme(
  //   primary: MyColors.lPrimary,
  //   onPrimary: MyColors.lTextColor,
  //   secondary: MyColors.lSecondary,
  //   onSecondary: MyColors.lTextColor,
  //   background: MyColors.lAppBg,
  //   onBackground: MyColors.lTextColor,
  //   surface: MyColors.buttonColor,
  //   onSurface: MyColors.lTextColor,
  //   error: MyColors.errorColor,
  //   onError: MyColors.lTextColor,
  // ),
  // textTheme: textLightTheme,
  // primaryColor: MyColors.lPrimary,
  // scaffoldBackgroundColor: MyColors.lAppBg,
  // buttonTheme: _btnTheme,
  // elevatedButtonTheme: _elevatedButton,
);

ThemeData darkTheme = ThemeData(
  // floatingActionButtonTheme: _floatingActionButtonTheme,
  // inputDecorationTheme: _inputDecoration,
  // visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: "Noto Sans",
  // textTheme: textDarkTheme,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  brightness: Brightness.dark,
  // colorScheme: ColorScheme(
  //   brightness: Brightness.dark,
  //   primary: MyColors.dPrimary,
  //   onPrimary: MyColors.dTextColor,
  //   secondary: MyColors.dSecondary,
  //   onSecondary: MyColors.dTextColor,
  //   background: const Color.fromARGB(255, 0, 0, 0),
  //   onBackground: MyColors.dTextColor,
  //   surface: MyColors.highlighted,
  //   onSurface: MyColors.dTextColor,
  //   error: MyColors.errorColor,
  //   onError: MyColors.dTextColor,
  // ),
  // primaryColor: MyColors.dPrimary,
  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
  // buttonTheme: _btnTheme,
  // elevatedButtonTheme: _elevatedButton,
);
