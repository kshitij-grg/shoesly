import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCircleWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final double? height, width;
  final EdgeInsetsGeometry? padding;
  const CustomCircleWidget({
    super.key,
    this.backgroundColor,
    this.padding,
    this.child,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: backgroundColor,
        height: height,
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}
