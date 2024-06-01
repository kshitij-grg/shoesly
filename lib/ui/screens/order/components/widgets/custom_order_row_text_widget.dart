import 'package:flutter/material.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../../../../../core/app/constants/app_styles.dart';

class CustomOrderRowTextWidget extends StatelessWidget {
  final String? leadtitle, trailtitle;

  const CustomOrderRowTextWidget({
    super.key,
    required this.leadtitle,
    required this.trailtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppText(
          text: leadtitle ?? '',
          color: context.colors.secondary,
        ),
        CustomAppText(
          text: "\$$trailtitle",
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
