import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../app/constants/app_colors.dart';

SystemUiOverlayStyle systemUiOverlayStyle(BuildContext context) {
  return SystemUiOverlayStyle(
      statusBarColor: AppColors.kTRANSPARENT,
      statusBarIconBrightness:
          context.isDarkMode ? Brightness.light : Brightness.dark);
}
