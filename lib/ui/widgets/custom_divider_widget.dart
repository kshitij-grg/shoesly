import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  final Color? color;
  const CustomDividerWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
    );
  }
}
