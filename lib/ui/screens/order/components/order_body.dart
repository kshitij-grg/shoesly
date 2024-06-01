import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_fonts_size.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/routes/route_config.dart';
import 'package:shoesly/core/routes/route_navigator.dart';
import 'package:shoesly/core/utils/custom_toasts.dart';
import 'package:shoesly/core/utils/responsive.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/ui/widgets/custom_add_widget.dart';
import 'package:shoesly/ui/widgets/custom_divider_widget.dart';

import '../../../../bloc/cart/cart_bloc.dart';
import '../../../../core/functions/get_cart_grand_total.dart';
import 'widgets/custom_order_info_widget.dart';
import 'widgets/custom_order_row_text_widget.dart';

class OrderBody extends StatefulWidget {
  const OrderBody({super.key});

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Responsive(
                context: context,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kVSizedBox3,
                    CustomAppText(
                      text: AppTexts.information,
                      fontSize: AppFontsSize.kS18,
                      fontWeight: FontWeight.w600,
                    ),
                    kVSizedBox2,
                    const CustomOrderInfoWidget(
                      title: AppTexts.paymentMethod,
                      subtitle: "Credit Card",
                    ),
                    kVSizedBox2,
                    CustomDividerWidget(
                      color: context.colors.secondaryBackgroundColor,
                    ),
                    kVSizedBox2,
                    const CustomOrderInfoWidget(
                      title: AppTexts.location,
                      subtitle: "Semarand, Indonesia",
                    ),
                    kVSizedBox3,
                    CustomAppText(
                      text: AppTexts.orderDetail,
                      fontSize: AppFontsSize.kS18,
                      fontWeight: FontWeight.w600,
                    ),
                    kVSizedBox2,
                    ListView.separated(
                      itemBuilder: (context, index) {
                        var model = state.cartModelList?[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomAppText(
                              text: model?.name ?? '',
                              style: context.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            kVSizedBox0,
                            CustomOrderRowTextWidget(
                              leadtitle:
                                  "${model?.brandName} . ${model?.color} . ${model?.size} . ${AppTexts.qty} ${model?.quantity}",
                              trailtitle: "${model?.price}",
                            )
                          ],
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => kVSizedBox2,
                      itemCount: state.cartModelList?.length ?? 0,
                    ),
                    kVSizedBox3,
                    CustomAppText(
                      text: AppTexts.paymentDetail,
                      fontSize: AppFontsSize.kS18,
                      fontWeight: FontWeight.w600,
                    ),
                    kVSizedBox2,
                    CustomOrderRowTextWidget(
                      leadtitle: AppTexts.subTotal,
                      trailtitle: getCartGrandTotal(
                          cartModelList: state.cartModelList ?? []),
                    ),
                    kVSizedBox2,
                    const CustomOrderRowTextWidget(
                      leadtitle: AppTexts.shipping,
                      trailtitle: "20",
                    ),
                    kVSizedBox2,
                    CustomDividerWidget(
                      color: context.colors.secondaryBackgroundColor,
                    ),
                    kVSizedBox2,
                    CustomOrderRowTextWidget(
                      leadtitle: AppTexts.totalOrder,
                      trailtitle: getCartGrandTotal(
                          cartModelList: state.cartModelList ?? [],
                          shipping: 20,
                          isShippingInclued: true),
                    ),
                    kVSizedBox4,
                  ],
                ),
              ),
            )),
            CustomAddWidget(
              trailTitle: AppTexts.payment,
              hasBtn: false,
              leadSubtitle: AppTexts.grandTotal,
              leadTitle:
                  getCartGrandTotal(cartModelList: state.cartModelList ?? []),
              trailOnTap: () {
                successToast(msg: AppTexts.orderPlaced, context: context);
                context.read<CartBloc>().add(CartListCleared());
                RouteNavigator.navigateOffAllNamed(
                    context, RouteConfig.discoverRoute);
              },
            ),
          ],
        );
      },
    );
  }
}
