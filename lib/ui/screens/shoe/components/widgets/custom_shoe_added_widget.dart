import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';

import '../../../../../bloc/shoe/shoe_bloc.dart';
import '../../../../../core/app/constants/app_dimensions.dart';
import '../../../../../core/app/constants/app_jsons.dart';
import '../../../../../core/app/constants/app_styles.dart';
import '../../../../../core/app/constants/app_texts.dart';

class CustomShoeAddedWidget extends StatelessWidget {
  const CustomShoeAddedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoeBloc, ShoeState>(
      builder: (context, state) {
        return Column(
          children: [
            kVSizedBox3,
            Lottie.asset(
              kDoneJson,
              repeat: false,
              width: 80,
              height: 80,
            ),
            kVSizedBox2,
            CustomAppText(
              text: AppTexts.addedToCart,
              style: context.textTheme.displaySmall,
            ),
            CustomAppText(
              text: "${state.quantity} ${AppTexts.itemTotal}",
              color: context.colors.secondary,
            ),
            kVSizedBox1,
          ],
        );
      },
    );
  }
}
