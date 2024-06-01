import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/app/constants/app_colors.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/routes/route_config.dart';
import 'package:shoesly/core/routes/route_navigator.dart';
import 'package:shoesly/core/utils/responsive.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/di_injection/get_di_init.dart';
import 'package:shoesly/ui/screens/shoe/components/review/components/review_body.dart';
import 'package:shoesly/ui/widgets/custom_add_widget.dart';
import 'package:shoesly/ui/widgets/custom_border_text_widget.dart';
import 'package:shoesly/ui/widgets/custom_bottomsheet_widget.dart';
import 'package:shoesly/ui/widgets/custom_circle_widget.dart';
import 'package:shoesly/ui/widgets/custom_network_widget.dart';
import 'package:shoesly/ui/widgets/custom_svg_widget.dart';

import '../../../../bloc/cart/cart_bloc.dart';
import '../../../../bloc/review/review_bloc.dart';
import '../../../../bloc/shoe/shoe_bloc.dart';
import '../../../../core/enums/enum.dart';
import '../../../../core/functions/get_color_value.dart';
import '../../../widgets/custom_circular_widget.dart';
import '../../../widgets/custom_data_not_found_wigdet.dart';
import '../../../widgets/custom_rating_widget.dart';
import 'review/components/widgets/custom_review_tile_widget.dart';
import 'widgets/custom_add_shoe_to_cart_widget.dart';
import 'widgets/custom_shoe_added_widget.dart';

class ShoeBody extends StatefulWidget {
  final String shoeId;
  const ShoeBody({super.key, required this.shoeId});

  @override
  State<ShoeBody> createState() => _ShoeBodyState();
}

class _ShoeBodyState extends State<ShoeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoeBloc, ShoeState>(
      builder: (context, state) {
        var model = state.shoeModel;
        return switch (state.fetchShoeDetailsStatus) {
          AppStatus.loading => const CustomCircularIndicatorWidget(),
          AppStatus.error => const CustomDataNotFoundWidget(),
          _ => Column(
              children: [
                Expanded(
                  child: Responsive(
                    context: context,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: context.colors.primaryBackgroundColor,
                            ),
                            height: appHeight(context) * .35,
                            width: appWidth(context),
                            padding: const EdgeInsets.all(15),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                PageView.builder(
                                  controller: PageController(),
                                  itemCount: model?.images?.length,
                                  itemBuilder: (context, index) {
                                    var imageModel = model?.images?[index];

                                    return CustomNetworkImageWidget(
                                      imageUrl: imageModel,
                                    );
                                  },
                                  onPageChanged: (value) => context
                                      .read<ShoeBloc>()
                                      .add(ShoeImageSwitched(index: value)),
                                ),
                                Positioned(
                                  left: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: (model?.images ?? [])
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return Container(
                                        width: 8,
                                        height: 8,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: state.imageIndex == entry.key
                                              ? context.colors.primary
                                              : context.colors.tertiary,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: context.colors.white,
                                    ),
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var colorModel = model?.colors?[index];
                                        bool isSelected =
                                            state.shoeColor == colorModel;

                                        return GestureDetector(
                                          onTap: () => context
                                              .read<ShoeBloc>()
                                              .add(ShoeColorSelected(
                                                  color: colorModel)),
                                          child: CustomCircleWidget(
                                            width: 20,
                                            backgroundColor: getColorValue(
                                                context: context,
                                                color: colorModel),
                                            padding: const EdgeInsets.all(5),
                                            child: isSelected
                                                ? CustomSvgWidget(
                                                    icon: kDoneVariantIcon,
                                                    width: 10,
                                                    height: 10,
                                                    color: AppColors.kWHITE,
                                                  )
                                                : null,
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          kHSizedBox1,
                                      itemCount: model?.colors?.length ?? 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          kVSizedBox2,
                          CustomAppText(
                            text: model?.name ?? '',
                            style: context.textTheme.headlineLarge,
                          ),
                          kVSizedBox1,
                          CustomRatingWidget(model: model),
                          kVSizedBox2,
                          CustomAppText(
                            text: AppTexts.size,
                            style: context.textTheme.headlineMedium,
                          ),
                          kVSizedBox1,
                          SizedBox(
                            height: 40,
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                var sizeModel = model?.sizes?[index];
                                bool isSelected = state.shoeSize == sizeModel;
                                return GestureDetector(
                                  onTap: () => context
                                      .read<ShoeBloc>()
                                      .add(ShoeSizeSelected(size: sizeModel)),
                                  child: CustomCircleWidget(
                                    padding: const EdgeInsets.all(10),
                                    backgroundColor: isSelected
                                        ? context.colors.primary
                                        : null,
                                    width: 40,
                                    hasBorder: !isSelected,
                                    child: CustomAppText(
                                      text: sizeModel ?? '',
                                      color: isSelected
                                          ? context.colors.white
                                          : context.colors.secondary,
                                    ),
                                  ),
                                );
                              },
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => kHSizedBox2,
                              itemCount: model?.sizes?.length ?? 5,
                            ),
                          ),
                          kVSizedBox2,
                          CustomAppText(
                            text: AppTexts.description,
                            style: context.textTheme.headlineMedium,
                          ),
                          kVSizedBox1,
                          CustomAppText(
                            text: model?.description ?? "",
                            textAlign: TextAlign.left,
                            color: context.colors.secondary,
                          ),
                          kVSizedBox2,
                          CustomAppText(
                            text:
                                "${AppTexts.review} (${model?.reviews?.length ?? 0})",
                            style: context.textTheme.headlineMedium,
                          ),
                          kVSizedBox1,
                          ListView.separated(
                            itemBuilder: (context, index) {
                              var reviewModel = model?.reviews?[index];
                              return CustomReviewTileWidget(
                                  reviewModel: reviewModel, model: model);
                            },
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => kVSizedBox2,
                            itemCount: (model?.reviews?.length ?? 0) > 3
                                ? 3
                                : model?.reviews?.length ?? 0,
                          ),
                          kVSizedBox3,
                          GestureDetector(
                            onTap: () {
                              context.read<ReviewBloc>().add(
                                  ReviewDataFetched(reviews: model?.reviews));

                              RouteNavigator.navigate(
                                  context, const ReviewBody());
                            },
                            child: const CustomBorderTextWidget(
                              title: AppTexts.seeAllReview,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                CustomAddWidget(
                  trailTitle: AppTexts.addToCart.toUpperCase(),
                  hasBtn: false,
                  leadTitle: "${model?.price ?? 0}",
                  trailOnTap: () {
                    context.read<ShoeBloc>().add(const ShoeCounterReset());
                    context.read<CartBloc>().add(const CartModelAdded());

                    customBottomSheetWidget(
                        context: context,
                        sheetTitle: AppTexts.addToCart,
                        isScrollControlled: false,
                        showTopBar: false,
                        widgetBody: BlocConsumer<CartBloc, CartState>(
                          listener: (context, cartState) {
                            if (cartState.cartAddStatus == AppStatus.success) {
                              context
                                  .read<CartBloc>()
                                  .add(const CartModelAdded(isShoeAdded: true));
                            }
                          },
                          builder: (context, cartState) {
                            return Column(
                              children: [
                                cartState.isShoeAdded
                                    ? const CustomShoeAddedWidget()
                                    : const CustomAddShoeToCartWidget(),
                                CustomAddWidget(
                                  hasBtn: cartState.isShoeAdded,
                                  leadTitle: cartState.isShoeAdded
                                      ? AppTexts.backExplore
                                      : "${model?.price ?? 0}",
                                  leadOnTap: () {
                                    RouteNavigator.back(context);
                                    RouteNavigator.back(context);
                                  },
                                  trailTitle: cartState.isShoeAdded
                                      ? AppTexts.toCart
                                      : AppTexts.addToCart,
                                  hasDecoration: false,
                                  trailOnTap: cartState.isShoeAdded
                                      ? () {
                                          RouteNavigator.back(context);
                                          RouteNavigator.replaceAndPushNamed(
                                              context, RouteConfig.cartRoute);
                                        }
                                      : () => context
                                          .read<ShoeBloc>()
                                          .addShoeToCartList(context: context),
                                ),
                                kVSizedBox2,
                              ],
                            );
                          },
                        ));
                  },
                ),
              ],
            ),
        };
      },
    );
  }

  @override
  void initState() {
    super.initState();
    shoeRepository.initShoeScreen(context: context, shoeId: widget.shoeId);
  }
}
