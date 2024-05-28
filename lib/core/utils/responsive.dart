import 'package:flutter/material.dart';

import '../app/constants/app_dimensions.dart';

// Class to make our app responsive to the respective devices such as Mobile and Tablet
class Responsive extends StatelessWidget {
  static const double kHTabletMainPagePadding = 20;
  static const double kHMobilePhonePadding = 20.0;
  final Widget? child;
  final BuildContext context;
  final double? mblLeft, mblRight, mblBottom, tabLeft, tabRight, tabBottom;
  const Responsive(
      {super.key,
      required this.context,
      required this.child,
      this.mblLeft,
      this.mblRight,
      this.mblBottom,
      this.tabLeft,
      this.tabRight,
      this.tabBottom});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: isMobile(ctx: context)
              ? mblLeft ?? kHMobilePhonePadding
              : tabLeft ?? kHTabletMainPagePadding,
          right: isMobile(ctx: context)
              ? mblRight ?? kHMobilePhonePadding
              : tabRight ?? kHTabletMainPagePadding,
          bottom: isMobile(ctx: context) ? mblBottom ?? 13 : tabBottom ?? 13),
      child: child,
    );
  }

  static bool isMobile({required BuildContext ctx}) => appWidth(ctx) < 600;

  static bool isTablet({required BuildContext ctx}) => appWidth(ctx) >= 600;
}
