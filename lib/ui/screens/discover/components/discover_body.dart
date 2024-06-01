import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_fonts_size.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/routes/route_config.dart';
import 'package:shoesly/core/routes/route_navigator.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/data/models/filter/filter_model.dart';
import 'package:shoesly/di_injection/get_di_init.dart';
import 'package:shoesly/ui/widgets/custom_circle_widget.dart';
import 'package:shoesly/ui/widgets/custom_circular_widget.dart';
import 'package:shoesly/ui/widgets/custom_data_not_found_wigdet.dart';
import 'package:shoesly/ui/widgets/custom_network_svg_widget.dart';
import 'package:shoesly/ui/widgets/custom_network_widget.dart';
import 'package:shoesly/ui/widgets/custom_svg_widget.dart';

import '../../../../bloc/brand/brand_bloc.dart';
import '../../../../bloc/cart/cart_bloc.dart';
import '../../../../bloc/shoe/shoe_bloc.dart';
import '../../../../core/enums/enum.dart';
import '../../../widgets/custom_rating_widget.dart';

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
              GestureDetector(
                onTap: () => RouteNavigator.navigateNamed(
                    context, RouteConfig.cartRoute),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CustomSvgWidget(
                          icon: kCartIcon,
                        ),
                        if (state.cartModelList?.isNotEmpty == true)
                          Positioned(
                            top: 5,
                            child: CustomCircleWidget(
                              backgroundColor: context.colors.error,
                              height: 8,
                              width: 8,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          kVSizedBox2,
          BlocConsumer<BrandBloc, BrandState>(
            listener: (context, state) {
              bool hasFiler = state.selectedBrand != AppTexts.all;

              if (state.brandSelectedstatus == AppStatus.success) {
                context.read<ShoeBloc>().add(ShoeFetched(
                    filterModel: FilterModel(brand: state.selectedBrand),
                    hasFilter: hasFiler));
              }
            },
            builder: (context, state) {
              return SizedBox(
                height: 40,
                child: ListView.separated(
                  itemCount: state.brandModelListWithAll?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => kHSizedBox2,
                  itemBuilder: (context, index) {
                    var model = state.brandModelListWithAll?[index];
                    bool isSelected = state.selectedBrand == model?.name;
                    return GestureDetector(
                      onTap: () => context
                          .read<BrandBloc>()
                          .add(BrandSelected(selectedBrand: model?.name)),
                      child: Container(
                        alignment: Alignment.center,
                        child: CustomAppText(
                          text: model?.name ?? '',
                          style: context.textTheme.headlineLarge!.copyWith(
                            color: isSelected ? null : context.colors.tertiary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          kVSizedBox2,
          Expanded(
            child: BlocBuilder<ShoeBloc, ShoeState>(
              builder: (context, state) {
                return switch (state.fetchShoeStatus) {
                  AppStatus.loading => const CustomCircularIndicatorWidget(),
                  AppStatus.error => const CustomDataNotFoundWidget(),
                  _ => GridView.builder(
                      itemCount: state.shoeModelList?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 225,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 30,
                      ),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var model = state.shoeModelList?[index];
                        return GestureDetector(
                          onTap: () => RouteNavigator.navigateNamed(
                            context,
                            RouteConfig.shoeRoute,
                            arguments: state.shoeModelList?.last
                                .id, //only because we have inserted all the required details in only one shoe otherwise use model?.id
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: context.colors.primaryBackgroundColor,
                                ),
                                height: 150,
                                width: 150,
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomNetworkSvgWidget(
                                      icon: model?.brandInfo?.brandImage ?? '',
                                      color: context.colors.tertiary,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: CustomNetworkImageWidget(
                                        imageUrl: model?.images?.first,
                                        height: 90,
                                        width: 100,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              kVSizedBox1,
                              CustomAppText(
                                text: model?.name ?? '',
                                style: context.textTheme.bodySmall,
                                maxLines: 1,
                              ),
                              kVSizedBox0,
                              CustomRatingWidget(model: model),
                              kVSizedBox0,
                              CustomAppText(
                                text: "\$${model?.price ?? 0}",
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                };
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
