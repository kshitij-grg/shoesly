import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../../../../../bloc/shoe/shoe_bloc.dart';
import '../../../../../core/app/constants/app_dimensions.dart';
import '../../../../../core/app/constants/app_icons.dart';
import '../../../../../core/app/constants/app_styles.dart';
import '../../../../../core/app/constants/app_texts.dart';
import '../../../../../core/routes/route_navigator.dart';
import '../../../../widgets/custom_svg_widget.dart';

class CustomAddShoeToCartWidget extends StatelessWidget {
  const CustomAddShoeToCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoeBloc, ShoeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 50,
                  height: 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: context.colors.tertiary,
                  ),
                ),
              ),
            ),
            kVSizedBox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomAppText(
                    text: AppTexts.addToCart,
                    style: context.textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () => RouteNavigator.back(context),
                  child: CustomSvgWidget(
                    icon: kCloseIcon,
                  ),
                ),
              ],
            ),
            kVSizedBox3,
            const CustomAppText(
              text: AppTexts.quantity,
              fontWeight: FontWeight.w600,
            ),
            kVSizedBox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAppText(
                  text: "${state.quantity}",
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          context.read<ShoeBloc>().add(ShoeCounterDecreased()),
                      child: CustomSvgWidget(
                        icon: kMinusCircleIcon,
                        color: state.quantity == 1
                            ? context.colors.tertiary
                            : null,
                      ),
                    ),
                    kHSizedBox1,
                    GestureDetector(
                      onTap: () =>
                          context.read<ShoeBloc>().add(ShoeCounterIncreased()),
                      child: CustomSvgWidget(
                        icon: kAddCircleIcon,
                      ),
                    ),
                  ],
                )
              ],
            ),
            kVSizedBox1,
            const Divider(),
            kVSizedBox1,
          ],
        );
      },
    );
  }
}
