import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_icons.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/ui/widgets/custom_svg_widget.dart';

class CustomDismissibleBackgroundWidget extends StatelessWidget {
  const CustomDismissibleBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 25),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colors.error,
      ),
      child: CustomSvgWidget(
        icon: kTrashIcon,
        color: context.colors.white,
      ),
    );
  }
}
