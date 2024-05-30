import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

class CustomCircleWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final double? height, width;
  final EdgeInsetsGeometry? padding;
  final bool hasBorder;
  const CustomCircleWidget({
    super.key,
    this.backgroundColor,
    this.padding,
    this.child,
    this.height,
    this.width,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          border: hasBorder
              ? Border.all(
                  color: context.colors.primaryBackgroundColor!,
                )
              : null,
          borderRadius: BorderRadius.circular(100)),
      height: height,
      width: width,
      padding: padding,
      child: Center(child: child),
    );
  }
}
