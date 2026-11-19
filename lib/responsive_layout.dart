import 'package:famous_gadget/breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Breakpoints.desktop) return desktop;
        if (constraints.maxWidth >= Breakpoints.tablet) {
          return tablet ?? desktop;
        }
        return mobile;
      },
    );
  }
}
