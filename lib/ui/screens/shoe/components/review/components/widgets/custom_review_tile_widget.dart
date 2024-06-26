import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../../../../../../../core/app/constants/app_dimensions.dart';
import '../../../../../../../core/app/constants/app_icons.dart';
import '../../../../../../../core/app/constants/app_styles.dart';
import '../../../../../../../core/utils/date_formatter.dart';
import '../../../../../../../data/models/shoe/shoe_model.dart';
import '../../../../../../widgets/custom_network_widget.dart';
import '../../../../../../widgets/custom_svg_widget.dart';

class CustomReviewTileWidget extends StatelessWidget {
  final Review? reviewModel;

  final ShoeModel? model;
  const CustomReviewTileWidget({
    super.key,
    this.reviewModel,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNetworkImageWidget(
          imageUrl: reviewModel?.image,
        ),
        kHSizedBox2,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAppText(
                    text: reviewModel?.username ?? '',
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAppText(
                    text: DateFormatter.timeAgo(reviewModel?.createAt),
                    style: context.textTheme.bodySmall!
                        .copyWith(color: context.colors.tertiary),
                  ),
                ],
              ),
              kVSizedBox0,
              // CustomRatingWidget(model: model),
              RatingBar(
                onRatingUpdate: (double value) {},
                ratingWidget: RatingWidget(
                  full: CustomSvgWidget(
                    icon: kStarIcon,
                    color: context.colors.warning,
                  ),
                  half: CustomSvgWidget(
                    icon: kStarIcon,
                    color: context.colors.warning,
                  ),
                  empty: CustomSvgWidget(
                    icon: kStarIcon,
                    color: context.colors.secondaryBackgroundColor,
                  ),
                ),
                initialRating: double.parse(reviewModel?.rating ?? "0"),
                itemSize: 14,
              ),
              kVSizedBox1,
              CustomAppText(
                text: reviewModel?.description ?? '',
                style: context.textTheme.bodySmall,
                maxLines: 5,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        )
      ],
    );
  }
}
