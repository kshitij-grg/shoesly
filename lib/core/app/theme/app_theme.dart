import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_texts.dart';
import 'app_theme_config.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: AppTexts.fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.kWHITE,
    splashColor: AppColors.kTRANSPARENT,
    textTheme: AppThemeConfig.textTheme(
      primaryText: AppColors.kPRIMARY,
      caption: AppColors.kWHITESHADE300,
    ),
    extensions: AppThemeConfig.themeExtension(),
    iconTheme: AppThemeConfig.iconTheme(color: AppColors.kPRIMARY),
    appBarTheme: AppThemeConfig.appBarTheme(backgroundColor: AppColors.kWHITE),
    sliderTheme: AppThemeConfig.sliderThemeData(),
    progressIndicatorTheme:
        AppThemeConfig.progressIndicatorTheme(color: AppColors.kPRIMARY),
  );
  static final darkTheme = ThemeData(
    fontFamily: AppTexts.fontFamily,
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.kPRIMARY,
    highlightColor: AppColors.kTRANSPARENT,
    textTheme: AppThemeConfig.textTheme(
      primaryText: AppColors.kWHITE,
    ),
    iconTheme: AppThemeConfig.iconTheme(color: AppColors.kWHITE),
    extensions: AppThemeConfig.themeExtension(isDarkTheme: true),
    appBarTheme:
        AppThemeConfig.appBarTheme(backgroundColor: AppColors.kPRIMARY),
    sliderTheme: AppThemeConfig.sliderThemeData(),
    progressIndicatorTheme:
        AppThemeConfig.progressIndicatorTheme(color: AppColors.kWHITE),
  );
}
