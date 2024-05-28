import 'package:flutter/material.dart';

import '../../core/app/constants/app_colors.dart';
import '../../core/app/constants/app_dimensions.dart';
import '../../core/app/constants/app_styles.dart';
import '../../core/enums/enum.dart';
import '../../core/utils/keyboard_action.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/theme_extensions.dart';
import 'custom_svg_widget.dart';

class CIconButton implements CustomButton {
  Widget customIconWidget({
    String? icon,
    double? iconHeight,
    double? iconWidth,
    Color? iconColor,
  }) {
    return CustomSvgWidget(
      icon: icon ?? "",
      height: iconHeight,
      width: iconWidth,
      color: iconColor,
    );
  }

  @override
  widget({
    required Function runCode,
    required BuildContext context,
    String? title,
    String? icon,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? margin,
    double? height,
    double? elevation,
    double? fontSize,
    double? width,
    double? borderRadius,
    double iconHeight = 20,
    double iconWidth = 20,
    bool isEnabled = true,
    bool hasTrailIcon = false,
    Color? backGroundColor,
    Color? iconColor,
    Color? titleColor,
  }) {
    return Container(
      margin: margin,
      height: height ?? Responsive.kButtonHeight,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: backGroundColor,
        ),
        onPressed: () {
          KeyboardAction.unfocus(context);
          runCode();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customIconWidget(
              icon: icon,
              iconColor: iconColor,
              iconHeight: iconHeight,
              iconWidth: iconWidth,
            ),
            kHSizedBox1,
            Flexible(
              child: FittedBox(
                child: CustomAppText(
                  text: "$title",
                  color: titleColor ?? AppColors.kWHITE,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            if (hasTrailIcon) ...[
              kHSizedBox1,
              customIconWidget(
                icon: icon,
                iconColor: iconColor,
                iconHeight: iconHeight,
                iconWidth: iconWidth,
              )
            ]
          ],
        ),
      ),
    );
  }
}

class CNormalButton implements CustomButton {
  @override
  widget({
    required Function runCode,
    required BuildContext context,
    String? title,
    String? icon,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? margin,
    double? height,
    double? elevation,
    double? fontSize,
    double? width,
    double? borderRadius,
    double? iconHeight,
    double? iconWidth,
    bool isEnabled = true,
    bool? hasTrailIcon,
    Color? backGroundColor,
    Color? iconColor,
    Color? titleColor,
  }) {
    var buttonTitleColor = isEnabled
        ? titleColor ?? AppColors.kWHITE
        : context.textTheme.bodySmall?.color;
    return Container(
      margin: margin,
      height: height ?? Responsive.kButtonHeight,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: isEnabled ? elevation : 0,
          backgroundColor: isEnabled ? backGroundColor : context.colors.primary,
        ),
        onPressed: () {
          KeyboardAction.unfocus(context);
          if (isEnabled) {
            runCode();
          }
        },
        child: CustomAppText(
          text: "$title",
          color: buttonTitleColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

abstract class CustomButton {
  factory CustomButton({ButtonType buttonType = ButtonType.normal}) {
    return switch (buttonType) {
      ButtonType.normal => CNormalButton(),
      ButtonType.icon => CIconButton(),
    };
  }

  widget({
    required final Function runCode,
    required final BuildContext context,
    required final String? title,
    final String? icon,
    final FontWeight? fontWeight,
    final EdgeInsetsGeometry? margin,
    final double? height,
    final double? borderRadius,
    final double elevation,
    final double? fontSize,
    final double? width,
    final double iconHeight,
    final double iconWidth,
    final bool isEnabled,
    final bool hasTrailIcon,
    final Color? backGroundColor,
    final Color? iconColor,
    final Color? titleColor,
  });
}
