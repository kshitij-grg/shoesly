import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../../../../di_injection/get_di_init.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      width: appWidth(context),
      height: appHeight(context),
      alignment: Alignment.center,
      child: CustomAppText(
        text: AppTexts.appName,
        style: context.textTheme.displayMedium,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    splashRepository.initSplashScreen(context: context);
  }
}
