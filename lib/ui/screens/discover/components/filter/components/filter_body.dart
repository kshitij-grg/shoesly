import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/utils/responsive.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/ui/screens/discover/components/filter/components/widgets/custom_container_text_widget.dart';
import 'package:shoesly/ui/widgets/custom_appbar_widget.dart';
import 'package:shoesly/ui/widgets/custom_circle_widget.dart';
import 'package:shoesly/ui/widgets/custom_svg_widget.dart';

class FilterBody extends StatelessWidget {
  const FilterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget.customAppBar(
        context: context,
        title: "Filter",
      ),
      body: Responsive(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppText(
                text: AppTexts.brands,
                style: context.textTheme.headlineMedium,
              ),
              kVSizedBox2,
              SizedBox(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CustomCircleWidget(
                              backgroundColor:
                                  context.colors.secondaryBackgroundColor,
                              padding: const EdgeInsets.all(15),
                              child: CustomSvgWidget(
                                icon: kNikeIcon,
                              ),
                            ),
                            CustomSvgWidget(
                              icon: kDoneIcon,
                              width: 18,
                              height: 18,
                            ),
                          ],
                        ),
                        const CustomAppText(
                          text: "Nike",
                        ),
                        CustomAppText(
                          text: "1001  Items",
                          style: context.textTheme.labelLarge,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => kHSizedBox3,
                  itemCount: 10,
                ),
              ),
              kVSizedBox2,
              CustomAppText(
                text: AppTexts.priceRange,
                style: context.textTheme.headlineMedium,
              ),
              kVSizedBox2,
              RangeSlider(
                values: const RangeValues(200, 750),
                min: 0,
                max: 1750,
                labels: const RangeLabels("\$0", "\$1750"),
                onChanged: (value) {},
                activeColor: context.colors.primary,
                inactiveColor: context.colors.primaryBackgroundColor,
              ),
              kVSizedBox2,
              CustomAppText(
                text: AppTexts.sortBy,
                style: context.textTheme.headlineMedium,
              ),
              kVSizedBox2,
              const CustomContainerTextWidget(
                text: "Most Recent",
              ),
              kVSizedBox2,
              CustomAppText(
                text: AppTexts.gender,
                style: context.textTheme.headlineMedium,
              ),
              kVSizedBox2,
              CustomAppText(
                text: AppTexts.color,
                style: context.textTheme.headlineMedium,
              ),
              kHSizedBox2,
            ],
          )),
    );
  }
}