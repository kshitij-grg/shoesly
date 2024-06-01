import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/utils/responsive.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/di_injection/get_di_init.dart';
import 'package:shoesly/ui/screens/filter/components/widgets/custom_container_text_widget.dart';
import 'package:shoesly/ui/screens/filter/components/widgets/custom_range_slider_widget.dart';
import 'package:shoesly/ui/widgets/custom_add_widget.dart';
import 'package:shoesly/ui/widgets/custom_circle_widget.dart';
import 'package:shoesly/ui/widgets/custom_network_svg_widget.dart';
import 'package:shoesly/ui/widgets/custom_svg_widget.dart';

import '../../../../bloc/brand/brand_bloc.dart';
import '../../../../bloc/filter/filter_bloc.dart';

class FilterBody extends StatelessWidget {
  const FilterBody({super.key});

  @override
  Widget build(BuildContext context) {
    var filterBloc = context.read<FilterBloc>();
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Responsive(
              context: context,
              child: BlocBuilder<FilterBloc, FilterState>(
                builder: (context, filterState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppText(
                        text: AppTexts.brands,
                        style: context.textTheme.headlineMedium,
                      ),
                      kVSizedBox2,
                      BlocBuilder<BrandBloc, BrandState>(
                        builder: (context, brandState) {
                          return SizedBox(
                            height: 100,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var model = brandState.brandModelList?[index];
                                bool isSelected =
                                    filterState.brand == model?.name;
                                return GestureDetector(
                                  onTap: () => filterBloc.add(
                                      FilterBrandSelected(brand: model?.name)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CustomCircleWidget(
                                            backgroundColor: context.colors
                                                .secondaryBackgroundColor,
                                            padding: const EdgeInsets.all(15),
                                            child: CustomNetworkSvgWidget(
                                              icon: model?.icon ?? '',
                                            ),
                                          ),
                                          if (isSelected)
                                            CustomSvgWidget(
                                              icon: kDoneIcon,
                                              width: 18,
                                              height: 18,
                                            ),
                                        ],
                                      ),
                                      CustomAppText(
                                        text: model?.name ?? '',
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CustomAppText(
                                        text: "${model?.quantity} Items",
                                        style: context.textTheme.labelLarge,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => kHSizedBox3,
                              itemCount: brandState.brandModelList?.length ?? 0,
                            ),
                          );
                        },
                      ),
                      kVSizedBox2,
                      CustomAppText(
                        text: AppTexts.priceRange,
                        style: context.textTheme.headlineMedium,
                      ),
                      kVSizedBox2,
                      CustomRangeSliderWidget(
                        onChange: (priceRange) => filterBloc.add(
                            FilterPriceRangeChanged(
                                minPrice: priceRange.start,
                                maxPrice: priceRange.end)),
                      ),
                      kVSizedBox2,
                      CustomAppText(
                        text: AppTexts.sortBy,
                        style: context.textTheme.headlineMedium,
                      ),
                      kVSizedBox2,
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          itemCount: filterRepository.sortbyList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) => kHSizedBox1,
                          itemBuilder: (context, index) {
                            var model = filterRepository.sortbyList[index];
                            // bool isSelected = state.selectedBrand == model?.name;
                            return GestureDetector(
                              // onTap: () => context
                              //     .read<BrandBloc>()
                              //     .add(BrandSelected(selectedBrand: model?.name)),
                              child:
                                  CustomContainerTextWidget(text: model.value),
                            );
                          },
                        ),
                      ),
                      kVSizedBox2,
                      CustomAppText(
                        text: AppTexts.gender,
                        style: context.textTheme.headlineMedium,
                      ),
                      kVSizedBox2,
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          itemCount: filterRepository.genderList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) => kHSizedBox1,
                          itemBuilder: (context, index) {
                            var model = filterRepository.genderList[index];
                            bool isSelected = filterState.gender == model;
                            return GestureDetector(
                              onTap: () => filterBloc
                                  .add(FilterGenderSelected(gender: model)),
                              child: CustomContainerTextWidget(
                                text: model,
                                hasBackgroundColor: isSelected,
                              ),
                            );
                          },
                        ),
                      ),
                      kVSizedBox2,
                      CustomAppText(
                        text: AppTexts.color,
                        style: context.textTheme.headlineMedium,
                      ),
                      kVSizedBox2,
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          itemCount: filterRepository.colorList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) => kHSizedBox1,
                          itemBuilder: (context, index) {
                            var model = filterRepository.colorList[index];
                            bool isSelected = filterState.color == model;
                            return GestureDetector(
                              onTap: () => filterBloc
                                  .add(FilterColorSelected(color: model)),
                              child: CustomContainerTextWidget(
                                text: model,
                                hasLeadWidget: true,
                                hasBackgroundColor: false,
                                borderColor:
                                    isSelected ? context.colors.primary : null,
                              ),
                            );
                          },
                        ),
                      ),
                      kHSizedBox2,
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        const CustomAddWidget(
          trailTitle: AppTexts.apply,
          leadTitle: AppTexts.reset,
        )
      ],
    );
  }
}
