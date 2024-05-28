import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../../core/app/constants/app_dimensions.dart';
import '../../core/app/constants/app_styles.dart';
import '../../core/routes/route_navigator.dart';
import 'custom_svg_widget.dart';

class CustomAppbarWidget {
  static PreferredSize customAppBar(
          {Function()? onBackTap,
          String title = "",
          Widget? trailing,
          required BuildContext context}) =>
      PreferredSize(
        preferredSize: Size(appWidth(context), appHeight(context) * .07),
        child: AppBar(
          centerTitle: false,
          leadingWidth: 0,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Container(
            margin: const EdgeInsets.only(top: 7),
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              children: [
                InkWell(
                  onTap: onBackTap ?? () => RouteNavigator.back(context),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 4, right: 6),
                    child: CustomSvgWidget(
                      icon: kArrowLeftIcon,
                      height: 23,
                      color: context.colors.primary,
                    ),
                  ),
                ),
                kHSizedBox1,
                const SizedBox(width: 3),
                Expanded(
                  child: CustomAppText(
                    text: title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineMedium,
                  ),
                ),
                kHSizedBox1,
                Visibility(
                  maintainSemantics: true,
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  visible: false,
                  child: trailing ?? const Text("data"),
                ),
              ],
            ),
          ),
        ),
      );
}
