import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/theme/app_theme_colors.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts_size.dart';

// This class stores the
class AppThemeConfig {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      shadowColor: AppColors.kTRANSPARENT,
      backgroundColor: AppColors.kPRIMARY,
      foregroundColor: AppColors.kWHITE,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );

  static AppBarTheme appBarTheme({required Color backgroundColor}) =>
      AppBarTheme(
        backgroundColor: backgroundColor,
      );

  static IconThemeData iconTheme({required Color color}) =>
      IconThemeData(color: color);

  static progressIndicatorTheme({Color? color}) =>
      ProgressIndicatorThemeData(color: color);

  static SliderThemeData sliderThemeData() => const SliderThemeData(
        activeTickMarkColor: AppColors.kDARKSHADE100,
      );

  static TextTheme textTheme({
    required Color primaryText, //For title.
    Color? caption, //For caption.
  }) =>
      TextTheme(
        displayLarge: customAppTextStyle(
          fontSize: AppFontsSize.kS48,
          color: primaryText,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: customAppTextStyle(
          fontSize: AppFontsSize.kS36,
          color: primaryText,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: customAppTextStyle(
          fontSize: AppFontsSize.kS24,
          color: primaryText,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: customAppTextStyle(
          fontSize: AppFontsSize.kS20,
          color: primaryText,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: customAppTextStyle(
          fontSize: AppFontsSize.kS16,
          color: primaryText,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: customAppTextStyle(
          fontSize: AppFontsSize.kS14,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: customAppTextStyle(
          fontSize: AppFontsSize.kS12,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: customAppTextStyle(
          fontSize: AppFontsSize.kS12,
          color: primaryText,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: customAppTextStyle(
          fontSize: AppFontsSize.kS10,
          color: primaryText,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: customAppTextStyle(
          fontSize: AppFontsSize.kS16,
          color: primaryText,
        ),
        bodyMedium: customAppTextStyle(
          fontSize: AppFontsSize.kS14,
          color: primaryText,
        ),
        bodySmall: customAppTextStyle(
          fontSize: AppFontsSize.kS12,
          color: primaryText,
        ),
        labelLarge: customAppTextStyle(
          fontSize: AppFontsSize.kS11,
          color: caption ?? primaryText,
        ),
      );

  static List<ThemeExtension<AppThemeColors>> themeExtension({
    bool isDarkTheme = false,
  }) =>
      [
        AppThemeColors(
          primary: isDarkTheme ? AppColors.kWHITE : AppColors.kPRIMARY,
          tertiary: AppColors.kWHITESHADE300,
          white: isDarkTheme ? AppColors.kPRIMARY : AppColors.kWHITE,
          secondary: AppColors.kWHITESHADE400,
          primaryBackgroundColor: AppColors.kWHITESHADE200,
          secondaryBackgroundColor: AppColors.kWHITESHADE100,
          warning: AppColors.kWARNING,
          error: AppColors.kERROR,
          information: AppColors.kINFORMATION,
        ),
      ];
}
