import 'package:flutter/material.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../../core/app/constants/app_styles.dart';

class CustomBorderTextWidget extends StatelessWidget {
  final String? title;

  const CustomBorderTextWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: context.colors.primaryBackgroundColor!,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
      alignment: Alignment.center,
      child: CustomAppText(
        text: title ?? "RESET",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
