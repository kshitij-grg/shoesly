import 'package:flutter/material.dart';

// Uniform Colors to use throughout the app
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color? primary,
      white,
      secondary,
      tertiary,
      primaryBackgroundColor,
      warning,
      secondaryBackgroundColor,
      information,
      error;

  const AppThemeColors({
    required this.primary,
    required this.tertiary,
    required this.secondary,
    required this.white,
    required this.primaryBackgroundColor,
    required this.warning,
    required this.error,
    required this.secondaryBackgroundColor,
    required this.information,
  });

  @override
  AppThemeColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? white,
    Color? backgroundColor,
    Color? error,
    Color? warning,
    Color? information,
    Color? secondaryBackgroundColor,
  }) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      tertiary: tertiary ?? tertiary,
      white: white ?? this.white,
      error: error ?? this.error,
      primaryBackgroundColor: backgroundColor ?? primaryBackgroundColor,
      secondary: secondary ?? this.secondary,
      warning: warning ?? this.warning,
      information: information ?? this.information,
      secondaryBackgroundColor:
          secondaryBackgroundColor ?? this.secondaryBackgroundColor,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other == null || other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors(
      primary: Color.lerp(primary, other.primary, t),
      tertiary: Color.lerp(tertiary, other.tertiary, t),
      information: Color.lerp(information, other.information, t),
      error: Color.lerp(error, other.error, t),
      secondaryBackgroundColor: Color.lerp(
          secondaryBackgroundColor, other.secondaryBackgroundColor, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      white: Color.lerp(white, other.white, t),
      primaryBackgroundColor:
          Color.lerp(primaryBackgroundColor, other.primaryBackgroundColor, t),
      warning: Color.lerp(warning, other.warning, t),
    );
  }
}
