import 'package:flutter/material.dart';

class Breakpoints {
  static const double tablet = 600;
  static const double desktop = 1100;
}

extension ScreenSize on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isMobile => screenWidth < Breakpoints.tablet;
  bool get isTable =>
      screenWidth >= Breakpoints.tablet && screenWidth < Breakpoints.desktop;
  bool get isDestop => screenWidth >= Breakpoints.desktop;
}
