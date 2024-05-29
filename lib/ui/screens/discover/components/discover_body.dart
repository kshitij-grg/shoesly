import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_fonts_size.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/app/constants/app_images.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/di_injection/get_di_init.dart';
import 'package:shoesly/ui/widgets/custom_circle_widget.dart';
import 'package:shoesly/ui/widgets/custom_svg_widget.dart';

import '../../../../bloc/brand/brand_bloc.dart';

class DiscoverBody extends StatefulWidget {
  const DiscoverBody({super.key});

  @override
  State<DiscoverBody> createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody> {
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
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  CustomSvgWidget(
                    icon: kCartIcon,
                  ),
                  Positioned(
                    top: 5,
                    child: CustomCircleWidget(
                      backgroundColor: context.colors.error,
                      height: 8,
                      width: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),
          kVSizedBox2,
          BlocBuilder<BrandBloc, BrandState>(
            builder: (context, state) {
              return SizedBox(
                height: 40,
                child: ListView.separated(
                  itemCount: state.brandModelList?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => kHSizedBox2,
                  itemBuilder: (context, index) {
                    var model = state.brandModelList?[index];
                    return Container(
                      alignment: Alignment.center,
                      child: CustomAppText(
                        text: model?.name ?? '',
                        style: context.textTheme.headlineLarge,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          kVSizedBox2,
          Expanded(
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 225,
                crossAxisSpacing: 15,
                mainAxisSpacing: 30,
              ),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: context.colors.primaryBackgroundColor,
                      ),
                      height: 150,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSvgWidget(
                            icon: kNikeIcon,
                            color: context.colors.tertiary,
                          ),
                          Image.asset(
                            kShoe1Image,
                            fit: BoxFit.contain,
                            height: 90,
                          ),
                        ],
                      ),
                    ),
                    kVSizedBox1,
                    CustomAppText(
                      text: "Jordan 1 Retro High Tie Dye",
                      style: context.textTheme.bodySmall,
                      maxLines: 1,
                    ),
                    kVSizedBox0,
                    Row(
                      children: [
                        CustomSvgWidget(
                          icon: kStarIcon,
                          height: 12,
                          width: 12,
                          color: context.colors.warning,
                        ),
                        kHSizedBox0,
                        CustomAppText(
                          text: "4.5",
                          style: context.textTheme.labelLarge!.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        kHSizedBox0,
                        CustomAppText(
                          text: "(1045 Reviews)",
                          style: context.textTheme.labelLarge,
                        ),
                      ],
                    ),
                    kVSizedBox0,
                    const CustomAppText(
                      text: "\$235,00",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    discoverRepository.initDiscoverScreen(context: context);
  }
}
