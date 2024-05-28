import 'package:flutter/material.dart';

class FontScale {
  //Function to adjust application font-size with respect to font-size of PHONE
  static MediaQueryData scaleSize({required BuildContext context}) {
    final mediaQuery = MediaQuery.of(context);
    final scale =
        mediaQuery.textScaler.clamp(minScaleFactor: 0.8, maxScaleFactor: 1.2);
    return mediaQuery.copyWith(textScaler: scale);
  }
}
