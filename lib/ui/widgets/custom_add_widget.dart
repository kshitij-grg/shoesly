import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';

import '../../core/app/constants/app_dimensions.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/theme_extensions.dart';
import 'custom_border_text_widget.dart';
import 'custom_button_widget.dart';

class CustomAddWidget extends StatelessWidget {
  final String? leadTitle, leadSubtitle, trailTitle;
  final Function()? leadOnTap, trailOnTap;
  final bool hasBtn, hasDecoration;

  const CustomAddWidget({
    super.key,
    this.leadTitle,
    this.trailTitle,
    this.leadOnTap,
    this.trailOnTap,
    this.leadSubtitle,
    this.hasBtn = true,
    this.hasDecoration = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 13, horizontal: Responsive.kHMobilePhonePadding),
      decoration: hasDecoration
          ? BoxDecoration(
              color: context.colors.white,
              border: context.isDarkMode
                  ? null
                  : Border(
                      top: BorderSide(
                          color: context.colors.primaryBackgroundColor!),
                    ),
              boxShadow: [
                BoxShadow(
                    color: context.colors.primaryBackgroundColor!,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, -1))
              ],
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: hasBtn ? 4 : 1,
            child: hasBtn
                ? GestureDetector(
                    onTap: leadOnTap,
                    child: CustomBorderTextWidget(title: leadTitle))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppText(
                        text: leadSubtitle ?? AppTexts.price,
                        style: context.textTheme.bodySmall!
                            .copyWith(color: context.colors.tertiary),
                      ),
                      CustomAppText(
                        text: "\$$leadTitle",
                        style: context.textTheme.headlineLarge,
                      ),
                    ],
                  ),
          ),
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
