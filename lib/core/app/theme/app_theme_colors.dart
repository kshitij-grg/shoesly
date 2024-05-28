import 'package:flutter/material.dart';

// Uniform Colors to use throughout the app
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color? primary, white, secondary, tertiaryText;

  const AppThemeColors({
    required this.primary,
    required this.tertiaryText,
    required this.secondary,
    required this.white,
  });

  @override
  AppThemeColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiaryText,
    Color? white,
  }) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      tertiaryText: tertiaryText ?? this.tertiaryText,
      white: white ?? this.white,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other == null || other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors(
      primary: Color.lerp(primary, other.primary, t),
      tertiaryText: Color.lerp(tertiaryText, other.tertiaryText, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      white: Color.lerp(white, other.white, t),
    );
  }
}
