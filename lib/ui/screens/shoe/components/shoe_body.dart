import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/app/constants/app_dimensions.dart';
import 'package:shoesly/core/app/constants/app_images.dart';
import 'package:shoesly/core/app/constants/app_styles.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/utils/responsive.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/di_injection/get_di_init.dart';
import 'package:shoesly/ui/widgets/custom_add_widget.dart';
import 'package:shoesly/ui/widgets/custom_circle_widget.dart';

import '../../../../bloc/shoe/shoe_bloc.dart';
import '../../../widgets/custom_rating_widget.dart';

class ShoeBody extends StatefulWidget {
  final String shoeId;
  const ShoeBody({super.key, required this.shoeId});

  @override
  State<ShoeBody> createState() => _ShoeBodyState();
}

class _ShoeBodyState extends State<ShoeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Responsive(
              context: context,
              child: BlocBuilder<ShoeBloc, ShoeState>(
                builder: (context, state) {
                  var model = state.shoeModel;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: context.colors.primaryBackgroundColor,
                        ),
                        height: appHeight(context) * .35,
                        width: appWidth(context),
                        padding: const EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                kShoe1Image,
                                // height: 90,
                                // width: 100,
                              ),
                            )
                          ],
                        ),
                      ),
                      kVSizedBox2,
                      CustomAppText(
                        text: "Jordan 1 Retro High Tie Dye",
                        style: context.textTheme.headlineLarge,
                      ),
                      kVSizedBox1,
                      CustomRatingWidget(model: model),
                      kVSizedBox2,
                      CustomAppText(
                        text: AppTexts.size,
                        style: context.textTheme.headlineMedium,
                      ),
                      kHSizedBox1,
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            var sizeModel = model?.sizes?[index];
                            bool isSelected = state.shoeSize == sizeModel;
                            return CustomCircleWidget(
                              padding: const EdgeInsets.all(10),
                              backgroundColor:
                                  isSelected ? context.colors.primary : null,
                              width: 40,
                              hasBorder: true,
                              child: CustomAppText(
                                text: "41",
                                color: isSelected
                                    ? context.colors.white
                                    : context.colors.secondary,
                              ),
                            );
                          },
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => kHSizedBox2,
                          itemCount: model?.sizes?.length ?? 5,
                        ),
                      ),
                      kVSizedBox2,
                      CustomAppText(
                        text: AppTexts.description,
                        style: context.textTheme.headlineMedium,
                      ),
                      kVSizedBox1,
                      CustomAppText(
                        text: model?.description ?? "",
                        textAlign: TextAlign.left,
                        color: context.colors.secondary,
                      ),
                      kVSizedBox2,
                      CustomAppText(
                        text:
                            "${AppTexts.review} (${model?.reviews?.length ?? 0})",
                        style: context.textTheme.headlineMedium,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        const CustomAddWidget(
          trailTitle: AppTexts.addToCart,
          hasBtn: false,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    shoeRepository.initShoeScreen(context: context, shoeId: widget.shoeId);
  }
}
