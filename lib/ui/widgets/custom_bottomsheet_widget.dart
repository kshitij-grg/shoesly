import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/ui/widgets/custom_svg_widget.dart';

import '../../core/app/constants/app_styles.dart';
import '../../core/routes/route_navigator.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/theme_extensions.dart';

customBottomSheetWidget(
    {String? sheetTitle,
    Widget? widgetBody,
    required BuildContext context,
    bool enableSecondaryHeader = false,
    bool isScrollControlled = true,
    bool? onlyRightWidget,
    Color? titleColor,
    bool? showTopBar = true,
    Function()? onPressedCancel,
    Function()? onPressedDone,
    bool showTop = true}) async {
  var titleMediumStyle = context.textTheme.headlineLarge;
  await showModalBottomSheet(
      enableDrag: true,
      useSafeArea: true,
      isScrollControlled: isScrollControlled,
      isDismissible: true,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Responsive.kAppBorderRadius)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showTopBar == true)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 50,
                    height: 3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              Container(
                margin: const EdgeInsets.only(
                    left: Responsive.kHMobilePhonePadding,
                    right: Responsive.kHMobilePhonePadding,
                    top: 14,
                    bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CustomAppText(
                        text: sheetTitle ?? "",
                        style: titleMediumStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: onPressedDone ??
                          () {
                            RouteNavigator.back(ctx);
                            onPressedDone;
                          },
                      child: CustomSvgWidget(
                        icon: kCloseIcon,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: isScrollControlled ? 1 : 0,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(
                      Responsive.kHMobilePhonePadding,
                      0,
                      Responsive.kHMobilePhonePadding,
                      0),
                  child: widgetBody ?? const SizedBox(),
                ),
              ),
            ],
          ),
        );
      });
}
