import 'package:flutter/material.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../../core/app/constants/app_dimensions.dart';
import '../../core/app/constants/app_icons.dart';
import '../../core/app/constants/app_styles.dart';
import '../../core/functions/get_average_rating_value.dart';
import '../../data/models/shoe/shoe_model.dart';
import 'custom_svg_widget.dart';

class CustomRatingWidget extends StatelessWidget {
  final ShoeModel? model;

  const CustomRatingWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvgWidget(
          icon: kStarIcon,
          height: 12,
          width: 12,
          color: context.colors.warning,
        ),
        kHSizedBox0,
        CustomAppText(
          text: "${getAverageRatingValue(reviewModel: model?.reviews)}",
          style: context.textTheme.labelLarge!.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHSizedBox0,
        CustomAppText(
          text: "(${model?.reviews?.length ?? 0} Reviews)",
          style: context.textTheme.labelLarge,
        ),
      ],
    );
  }
}
