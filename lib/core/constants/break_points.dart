import 'dart:ui';

import 'package:flutter/material.dart';

class BreakPoints {
  static const double desktop = 1200;
  static const double tablet = 900;
  static const double mobile = 600;

  static late double width, height;

  static void init(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }
}

// responsive text font size

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  var dispatcher = PlatformDispatcher.instance;
  var physicalWidth = dispatcher.views.first.physicalSize.width;
  var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  double width = physicalWidth / devicePixelRatio;

  return width < BreakPoints.tablet
      ? width / 1000
      : width < BreakPoints.desktop
      ? width / 1000
      : width / 1920;
}
