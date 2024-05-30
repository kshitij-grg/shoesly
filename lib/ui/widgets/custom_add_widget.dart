import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';

import '../../core/app/constants/app_dimensions.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/theme_extensions.dart';
import 'custom_button_widget.dart';

class CustomAddWidget extends StatelessWidget {
  final String? leadTitle, trailTitle;
  final Function()? leadOnTap, trailOnTap;
  final bool canUpdateCreate, hasBtn;
  final Color? trailBackGroundColor;

  const CustomAddWidget({
    super.key,
    this.leadTitle,
    this.trailTitle,
    this.leadOnTap,
    this.trailOnTap,
    this.hasBtn = true,
    this.trailBackGroundColor,
    this.canUpdateCreate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 13, horizontal: Responsive.kHMobilePhonePadding),
      decoration: BoxDecoration(
        color: context.colors.white,
        border: context.isDarkMode
            ? null
            : Border(
                top: BorderSide(color: context.colors.primaryBackgroundColor!),
              ),
        boxShadow: [
          BoxShadow(
              color: context.colors.primaryBackgroundColor!,
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, -1))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (hasBtn) ...[
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: context.colors.primaryBackgroundColor!,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
                alignment: Alignment.center,
                child: const CustomAppText(
                  text: "RESET",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ] else ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppText(
                  text: AppTexts.price,
                  style: context.textTheme.bodySmall!
                      .copyWith(color: context.colors.tertiary),
                ),
                CustomAppText(
                  text: "\$235.00",
                  style: context.textTheme.headlineLarge,
                ),
              ],
            )
          ],
          kHSizedBox2,
          Expanded(
            flex: 3,
            child: CustomButton().widget(
              context: context,
              runCode: trailOnTap ?? () {},
              title: trailTitle,
              titleColor: context.colors.white,
              iconColor: context.colors.white,
              backGroundColor: context.colors.primary,
            ),
          )
        ],
      ),
    );
  }
}
