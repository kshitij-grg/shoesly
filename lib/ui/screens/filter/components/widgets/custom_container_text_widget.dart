import 'package:flutter/cupertino.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

class CustomContainerTextWidget extends StatelessWidget {
  final String? text;
  const CustomContainerTextWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: context.colors.primary,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomAppText(
        text: text ?? '',
        style:
            context.textTheme.bodyLarge!.copyWith(color: context.colors.white),
      ),
    );
  }
}
