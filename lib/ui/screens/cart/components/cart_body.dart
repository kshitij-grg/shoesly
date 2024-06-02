import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/bloc/cart/cart_bloc.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/enums/enum.dart';
import 'package:shoesly/core/routes/route_config.dart';
import 'package:shoesly/core/routes/route_navigator.dart';
import 'package:shoesly/core/utils/custom_toasts.dart';
import 'package:shoesly/core/utils/responsive.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/ui/widgets/custom_add_widget.dart';
import 'package:shoesly/ui/widgets/custom_data_not_found_wigdet.dart';
import 'package:shoesly/ui/widgets/custom_dismissable_background_widget.dart';
import 'package:shoesly/ui/widgets/custom_network_widget.dart';

import '../../../../core/app/constants/app_icons.dart';
import '../../../../core/functions/get_cart_grand_total.dart';
import '../../../widgets/custom_svg_widget.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state.cartDeleteStatus == AppStatus.success) {
          successToast(message: AppTexts.cartItemDeleteMsg);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: state.cartModelList?.isEmpty == true ||
                      state.cartModelList == null
                  ? Responsive(
                      context: context, child: const CustomDataNotFoundWidget())
                  : SingleChildScrollView(
                      child: Responsive(
                        context: context,
                        child: ListView.separated(
                            itemCount: state.cartModelList?.length ?? 0,
                            separatorBuilder: (context, index) => kVSizedBox2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var model = state.cartModelList?[index];
                              return Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                background:
                                    const CustomDismissibleBackgroundWidget(),
                                onDismissed: (direction) => context
                                    .read<CartBloc>()
                                    .add(CartListUpdated(
                                        cartStatus: CartStatus.delete,
                                        index: index)),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: context
                                            .colors.primaryBackgroundColor,
                                      ),
                                      height: 88,
                                      width: 88,
                                      padding: const EdgeInsets.all(15),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomNetworkImageWidget(
                                          imageUrl: model?.image,
                                        ),
                                      ),
                                    ),
                                    kHSizedBox2,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomAppText(
                                            text: model?.name ?? '',
                                            style: context.textTheme.bodyLarge!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          kVSizedBox0,
                                          CustomAppText(
                                            text:
                                                "${model?.brandName} . ${model?.color} . ${model?.size}",
                                            style: context.textTheme.bodySmall!
                                                .copyWith(
                                                    color: context
                                                        .colors.secondary),
                                          ),
                                          kVSizedBox1,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomAppText(
                                                text: "\$${model?.price}",
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => context
                                                        .read<CartBloc>()
                                                        .add(CartListUpdated(
                                                          cartStatus:
                                                              CartStatus.update,
                                                          counterStatus:
                                                              CounterStatus
                                                                  .minus,
                                                          index: index,
                                                        )),
                                                    child: CustomSvgWidget(
                                                      icon: kMinusCircleIcon,
                                                      color:
                                                          model?.quantity == 1
                                                              ? context.colors
                                                                  .tertiary
                                                              : null,
                                                    ),
                                                  ),
                                                  kHSizedBox0,
                                                  CustomAppText(
                                                    text:
                                                        "${model?.quantity ?? 0}",
                                                  ),
                                                  kHSizedBox0,
                                                  GestureDetector(
                                                    onTap: () => context
                                                        .read<CartBloc>()
                                                        .add(CartListUpdated(
                                                          cartStatus:
                                                              CartStatus.update,
                                                          counterStatus:
                                                              CounterStatus.add,
                                                          index: index,
                                                        )),
                                                    child: CustomSvgWidget(
                                                      icon: kAddCircleIcon,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
            ),
            CustomAddWidget(
              trailTitle: AppTexts.checkout,
              leadSubtitle: AppTexts.grandTotal,
              hasBtn: false,
              leadTitle:
                  getCartGrandTotal(cartModelList: state.cartModelList ?? []),
              trailOnTap: () => state.cartModelList?.isEmpty == true
                  ? errorToast(message: AppTexts.proceedError)
                  : RouteNavigator.navigateNamed(
                      context, RouteConfig.orderRoute),
            ),
          ],
        );
      },
    );
  }
}
