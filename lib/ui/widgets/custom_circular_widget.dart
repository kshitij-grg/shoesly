import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';

import '../../core/app/constants/app_dimensions.dart';

class CustomCircularIndicatorWidget extends StatelessWidget {
  final String? data;
  final double strokeWidth;
  final double? height;
  final double? width;

  const CustomCircularIndicatorWidget(
      {super.key, this.data, this.strokeWidth = 2, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: CircularProgressIndicator(strokeWidth: strokeWidth),
          ),
          kVSizedBox0,
          CustomAppText(text: data ?? "Please wait...")
        ],
      ),
    );
  }
}
