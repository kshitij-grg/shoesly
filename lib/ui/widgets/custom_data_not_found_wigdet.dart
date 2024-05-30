import 'package:flutter/material.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';

class CustomDataNotFoundWidget extends StatelessWidget {
  final String resultInfo;
  const CustomDataNotFoundWidget(
      {super.key, this.resultInfo = "No Data Found!"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppText(text: resultInfo),
        ],
      ),
    );
  }
}
