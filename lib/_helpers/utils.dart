import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

space(double? width, double? height) =>
    SizedBox(height: height ?? 0, width: width ?? 0);

// bool isMobile(Size double) => double.width < mobileMode ? true : false;

double parseDouble(dynamic mobileMode) => double.parse("$mobileMode");

List<MaterialColor> randomColors(int limit) {
  List<MaterialColor> colors = [];
  for (var i = 0; i < limit; i++) {
    MaterialColor color =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    colors.add(color);
  }
  return colors;
}

showSnankbar(BuildContext context, String? message) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? "Processing"),
      ),
    );

Future fetchJson({path = "lib/_helpers/config.json"}) async {
  final String response = await rootBundle.loadString(path);
  final data = await json.decode(response);
}

divider(double thickness, Color? color) => Divider(
      thickness: thickness,
      color: color,
    );

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}
