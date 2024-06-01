import 'package:flutter/material.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../../../../../core/app/constants/app_dimensions.dart';
import '../../../../../core/app/constants/app_icons.dart';
import '../../../../../core/app/constants/app_styles.dart';
import '../../../../widgets/custom_svg_widget.dart';

class CustomOrderInfoWidget extends StatelessWidget {
  final String? title, subtitle;

  const CustomOrderInfoWidget({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppText(
              text: title ?? '',
              fontWeight: FontWeight.w600,
            ),
            kVSizedBox0,
            CustomAppText(
              text: subtitle ?? '',
              color: context.colors.tertiary,
            ),
          ],
        ),
        CustomSvgWidget(
          icon: kArrowRightIcon,
          color: context.colors.tertiary,
        ),
      ],
    );
  }
}
