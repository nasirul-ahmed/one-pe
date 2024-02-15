import 'package:flutter/material.dart';
import 'dart:math';

class MyColors {
  MyColors._();

  static Color lAppBg = fromHex("#F5F5F5");
  static Color lPrimary = fromHex("#00C853");
  static Color lSecondary = fromHex("#388E3C");
  static Color lTextColor = fromHex("#333333");

  static const Color dAppBg = Color.fromARGB(255, 0, 0, 0);
  static Color dPrimary = Color.fromARGB(255, 0, 0, 0);
  static Color dSecondary = fromHex("#64DD17");
  static Color dTextColor = fromHex("#E0E0E0");

  static Color buttonColor = fromHex("#1B5E20");
  static Color highlighted = fromHex("#00E676");
  static Color successColor = fromHex("#64DD17");
  static Color errorColor = fromHex("#D50000");

  static const Color transparant = Colors.transparent;
  static const Color dark = Color(0xff222222);
  static const Color white = Color(0xffffffff);
  static const Color blue = Color(0xff0000ff);
  static const Color red = Color(0xffff0000);
  static const Color green = Color.fromRGBO(121, 203, 134, 1);
  static const Color lightBlue = Color(0xffaaaaff);
  static const Color materialDak = Color.fromARGB(255, 47, 47, 47);
  static const Color drawerBackGround = Color(0xff10252F);
  static const Color divider = Color.fromRGBO(255, 255, 255, 0.08);
  static const Color dividerDark = Color.fromRGBO(255, 255, 255, 0.08);
  static const Color dividerlight = Color.fromRGBO(37, 36, 36, 0.078);
  static const Color lightText = Color.fromARGB(255, 147, 136, 130);
  static const Color darkText = Color.fromARGB(255, 153, 181, 187);
  static const Color splash = Color.fromRGBO(255, 171, 103, 1);
  static const Color lightCardBg = Color.fromRGBO(135, 101, 67, 1);
  static const Color darkCardBg = Color.fromRGBO(146, 235, 255, 1);
  static Color green300 = fromHex('#79cb86');
  static Color cyanA1002d = fromHex('#2d91ebff');
  static Color gray900Cc01 = fromHex('#cc0a1a1c');
  static Color cyanA100 = fromHex('#8dfce8');
  static Color cyanA1007e01 = fromHex('#7e8dfde8');
  static Color cyan2007e = fromHex('#7e7febf2');
  static Color gray900Cc02 = fromHex('#cc0f1823');
  static Color whiteA7003f = fromHex('#3fffffff');
  static Color red600 = fromHex('#d94040');
  static Color gray90010 = fromHex('#112332');
  static Color lightGreen400 = fromHex('#98cd75');
  static Color teal300 = fromHex('#4dc6b7');
  static Color black90001 = fromHex('#050e0f');
  static Color teal500 = fromHex('#0ca46f');
  static Color whiteA70014 = fromHex('#14ffffff');
  static Color cyanA10000 = fromHex('#008dfde8');
  static Color whiteA70019 = fromHex('#19ffffff');
  static Color blueGray90001 = fromHex('#2b2e33');
  static Color pink500 = fromHex('#ec3455');
  static Color blueGray900 = fromHex('#142f34');
  static Color black90003 = fromHex('#030507');
  static Color cyan20000 = fromHex('#006ad5ec');
  static Color black90002 = fromHex('#070c12');
  static Color black90004 = fromHex('#010203');
  static Color tealA700 = fromHex('#0cbd88');
  static Color blueGray300 = fromHex('#98b4bb');
  static Color gray90066 = fromHex('#66103427');
  static Color gray800 = fromHex('#434343');
  static Color teal3007e = fromHex('#7e4dc6b7');
  static Color green3007e = fromHex('#7e79cb86');
  static Color teal30001 = fromHex('#3ec496');
  static Color teal30002 = fromHex('#37c399');
  static Color cyan200 = fromHex('#7febf2');
  static Color tealA20001 = fromHex('#52ffc1');
  static Color black90011 = fromHex('#11000000');
  static Color tealA20000 = fromHex('#0053ffc1');
  static Color whiteA70026 = fromHex('#26ffffff');
  static Color teal60001 = fromHex('#009c66');
  static Color bluegray400 = fromHex('#888888');
  static Color cyanA100Cc = fromHex('#cc91ebff');
  static Color green30001 = fromHex('#73cb88');
  static Color gray70087 = fromHex('#87575353');
  static Color blueGray40001 = fromHex('#818999');
  static Color whiteA700 = fromHex('#ffffff');
  static Color cyan20011 = fromHex('#116ad5ec');
  static Color orange3007f = fromHex('#7fe8b261');
  static Color green200 = fromHex('#9bdaa9');
  static Color whiteA7001e = fromHex('#1effffff');
  static Color whiteA700D8 = fromHex('#d8ffffff');
  static Color gray900Cc = fromHex('#cc111e2c');
  static Color teal60059 = fromHex('#59107a7d');
  static Color green800 = fromHex('#1a8d41');
  static Color greenA200 = fromHex('#73fbaa');
  static Color teal200 = fromHex('#74d5b4');
  static Color teal400 = fromHex('#3cc584');
  static Color black90023 = fromHex('#23000000');
  static Color teal600 = fromHex('#1a8d6a');
  static Color cyanA10026 = fromHex('#2692ebff');
  static Color whiteA70031 = fromHex('#31ffffff');
  static Color black900 = fromHex('#000000');
  static Color deepOrange600 = fromHex('#ec521f');
  static Color cyanA10021 = fromHex('#2191ebff');
  static Color yellow900 = fromHex('#ff8d24');
  static Color black90026 = fromHex('#26000000');
  static Color gray90002 = fromHex('#0f1823');
  static Color green20000 = fromHex('#009fdeae');
  static Color gray700 = fromHex('#575353');
  static Color gray90003 = fromHex('#212327');
  static Color gray90004 = fromHex('#0e1823');
  static Color green20002 = fromHex('#9fdeae');
  static Color gray90005 = fromHex('#0f1319');
  static Color green20001 = fromHex('#9fd1ab');
  static Color blueGray400 = fromHex('#74929d');
  static Color cyanA1007e = fromHex('#7e8dfce8');
  static Color whiteA700A5 = fromHex('#a5ffffff');
  static Color green20003 = fromHex('#abe6b8');
  static Color green2000001 = fromHex('#00abe6b8');
  static Color blueGray600 = fromHex('#546a6d');
  static Color gray900 = fromHex('#111e2c');
  static Color gray90001 = fromHex('#0a1a1c');
  static Color whiteA7002d = fromHex('#2dffffff');
  static Color gray90006 = fromHex('#081719');
  static Color black9002d = fromHex('#2d000000');
  static Color tealA200 = fromHex('#53ffc1');
  static Color gray90007 = fromHex('#1c2714');
  static Color gray90008 = fromHex('#151f28');
  static Color gray100 = fromHex('#f4f4f4');
  static Color tealA400 = fromHex('#26cf9c');
  static Color gray90009 = fromHex('#141f27');
  static Color whiteA70000 = fromHex('#00ffffff');
  static Color greenA20001 = fromHex('#52ff97');
  static Color tealA7007e = fromHex('#7e0cbd88');
  static Color greenA20000 = fromHex('#0073fcaa');
  static Color greenA20002 = fromHex('#67dd9e');
  static Color teal3007e01 = fromHex('#7e3ec496');
  static Color cyan200Cc = fromHex('#cc6ad5ec');

  static LinearGradient gradient1 = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    colors: [
      Color.fromRGBO(146, 235, 255, 0.18),
      Color.fromRGBO(107, 213, 237, 0)
    ],
  );

// Second linear gradient
  static LinearGradient gradient2 = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    colors: [
      Color.fromRGBO(255, 255, 255, 0),
      Color.fromRGBO(255, 255, 255, 0.03)
    ],
  );

// Third linear gradient
  static LinearGradient gradient3 = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    colors: [
      Color.fromRGBO(255, 255, 255, 0.04),
      Color.fromRGBO(255, 255, 255, 0.03)
    ],
  );

  static LinearGradient activeGradientDark = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(77, 198, 183, 1),
        Color.fromRGBO(13, 189, 136, 1),
      ]);

  static LinearGradient inActiveGradientDark = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(46, 111, 109, 1),
        Color.fromRGBO(22, 104, 90, 1),
      ]);

  static LinearGradient activeGradientLight = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(255, 171, 103, 1),
        Color.fromRGBO(255, 112, 112, 1),
      ]);

  static LinearGradient inActiveGradientLight = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(255, 171, 103, 0.5),
        Color.fromRGBO(255, 112, 112, 0.5),
      ]);

  static Gradient myBg = const LinearGradient(colors: [
    Color.fromRGBO(17, 29, 44, 1),
    Color.fromRGBO(9, 22, 24, 1),
    Color.fromRGBO(12, 19, 28, 1),
  ]);

  static Gradient linearGradient(AlignmentGeometry begin, AlignmentGeometry end,
          List<Color> colors, int radians) =>
      LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
        transform: GradientRotation(
          pi / radians,
        ),
        tileMode: TileMode.clamp,
      );
  static Gradient radialGradient(AlignmentGeometry alignment,
          List<Color> colors, double radius, int radians) =>
      RadialGradient(
        center: alignment,
        colors: colors,
        radius: radius,
        transform: GradientRotation(
          pi / radians,
        ),
        tileMode: TileMode.clamp,
      );

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

//   static getGradients({required List<MixGradientModel> property}) {
//     return Stack(
//       children: property.map((el) {
//         Gradient? gradient;
//         switch (el.type) {
//           case Gradients.radial:
//             gradient =
//                 radialGradient(el.center!, el.colors, el.radius!, el.radians!);
//             break;
//           case Gradients.linear:
//             gradient =
//                 linearGradient(el.start!, el.end!, el.colors, el.radians!);
//         }
//         return Container(
//           decoration: BoxDecoration(gradient: gradient),
//         );
//       }).toList(),
//     );
//   }
}
