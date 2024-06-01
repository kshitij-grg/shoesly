import 'package:flutter/cupertino.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../../../../../core/functions/get_color_value.dart';
import '../../../../widgets/custom_circle_widget.dart';

class CustomContainerTextWidget extends StatelessWidget {
  final String? text;
  final bool hasLeadWidget, hasBackgroundColor;
  final Color? borderColor;
  const CustomContainerTextWidget({
    super.key,
    this.text,
    this.borderColor,
    this.hasLeadWidget = false,
    this.hasBackgroundColor = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: hasBackgroundColor ? context.colors.primary : null,
        border: hasBackgroundColor
            ? null
            : Border.all(
                color: borderColor ?? context.colors.primaryBackgroundColor!,
              ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Row(
        children: [
          if (hasLeadWidget) ...[
            CustomCircleWidget(
              width: 20,
              height: 20,
              backgroundColor: getColorValue(color: text, context: context),
              padding: const EdgeInsets.all(5),
            ),
            kHSizedBox1,
          ],
          CustomAppText(
            text: text ?? '',
            style: context.textTheme.bodyLarge!.copyWith(
                color: hasBackgroundColor ? context.colors.white : null),
          ),
        ],
      ),
    );
  }
}
