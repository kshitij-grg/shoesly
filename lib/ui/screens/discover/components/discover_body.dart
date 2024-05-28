import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_fonts_size.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/ui/widgets/custom_svg_widget.dart';

class DiscoverBody extends StatelessWidget {
  const DiscoverBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kVSizedBox3,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppText(
                text: AppTexts.discover,
                style: context.textTheme.headlineLarge!.copyWith(
                    fontSize: AppFontsSize.kS30, fontWeight: FontWeight.bold),
              ),
              CustomSvgWidget(
                icon: kCartIcon,
              ),
            ],
          ),
          kVSizedBox2,
          CustomAppText(
            text: "All",
            style: context.textTheme.headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          CustomAppText(
            text: "All",
            style: context.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colors.tertiaryText),
          ),
        ],
      ),
    );
  }
}
