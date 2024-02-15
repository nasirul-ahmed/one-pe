import 'package:flutter/material.dart';
import 'dart:ui' as ui;

const num SCREEN_WIDTH = 390;
const num SCREEN_HEIGHT = 844;
const num STATUS_BAR = 39;

Size size = ui.PlatformDispatcher.instance.views.first.physicalSize /
    ui.PlatformDispatcher.instance.views.first.devicePixelRatio;

get width {
  return size.width;
}

get height {
  num statusBar =
      MediaQueryData.fromView(ui.PlatformDispatcher.instance.views.first)
          .viewPadding
          .top;
  num bottomBar =
      MediaQueryData.fromView(ui.PlatformDispatcher.instance.views.first)
          .viewPadding
          .bottom;
  num screenHeight = size.height - statusBar - bottomBar;
  return screenHeight;
}

get deviceWidth {
  return size.width;
}

get deviceheight {
  num statusBar =
      MediaQueryData.fromView(ui.PlatformDispatcher.instance.views.first)
          .viewPadding
          .top;
  num bottomBar =
      MediaQueryData.fromView(ui.PlatformDispatcher.instance.views.first)
          .viewPadding
          .bottom;

  num screenHeight = size.height - statusBar - bottomBar;

  return screenHeight;
}

setHeight(double px) {
  double result = (px / SCREEN_HEIGHT) * 100;
  return (result * size.height) / 100;
}

setWidth(double px) {
  double result = (px / SCREEN_WIDTH) * 100;
  return (result * size.width) / 100;
}

double getHorizontalSize(double px) {
  return ((px * width) / SCREEN_WIDTH);
}

double getVerticalSize(double px) {
  return ((px * height) / (SCREEN_HEIGHT));
}

double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

double getFontSize(double px) {
  return getSize(px);
}

EdgeInsetsGeometry getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

EdgeInsetsGeometry getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

EdgeInsetsGeometry getMarginOrPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = setWidth(all);
    top = setHeight(all);
    right = setWidth(all);
    bottom = setHeight(all);
  }
  return EdgeInsets.only(
    left: getHorizontalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    right: getHorizontalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}
