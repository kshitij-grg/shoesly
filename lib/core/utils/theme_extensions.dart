import 'package:flutter/material.dart';
import 'package:shoesly/core/app/theme/app_theme_colors.dart';

// Extension on Buildcontext for the easiness of getting the value as they will be used frequently throughout the app
extension ThemeExtension on BuildContext {
  AppThemeColors get colors => Theme.of(this).extension<AppThemeColors>()!;
  IconThemeData get iconTheme => Theme.of(this).iconTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
