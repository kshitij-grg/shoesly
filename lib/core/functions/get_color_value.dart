import 'package:flutter/material.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

Color? getColorValue({String? color, required BuildContext context}) {
  return switch (color) {
    "Red" => context.colors.error,
    "Blue" => context.colors.information,
    "Black" => context.colors.primary,
    _ => context.colors.white,
  };
}
