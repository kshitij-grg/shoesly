import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/utils/responsive.dart';
import 'package:shoesly/core/utils/theme_extensions.dart';
import 'package:shoesly/di_injection/get_di_init.dart';
import 'package:shoesly/ui/widgets/custom_appbar_widget.dart';

import '../../../../../../bloc/review/review_bloc.dart';
import '../../../../../../core/app/constants/app_dimensions.dart';
import '../../../../../../core/app/constants/app_styles.dart';
import '../../../../../../core/enums/enum.dart';
import 'widgets/custom_review_tile_widget.dart';

class ReviewBody extends StatefulWidget {
  const ReviewBody({super.key});

  @override
  State<ReviewBody> createState() => _ReviewBodyState();
}

class _ReviewBodyState extends State<ReviewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewBloc, ReviewState>(
      listener: (context, state) {
        if (state.starSelectedStatus == AppStatus.success) {
          context.read<ReviewBloc>().add(const ReviewDataFiltered());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppbarWidget.customAppBar(
            context: context,
            title: "${AppTexts.review} (${state.reviews?.length})",
          ),
          body: Responsive(
            context: context,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    itemCount: reviewRepository.reviewHeadings.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) => kHSizedBox2,
                    itemBuilder: (context, index) {
                      var model = reviewRepository.reviewHeadings[index];
                      bool isSelected = state.selectedStar == model.id;
                      return GestureDetector(
                        onTap: () => context.read<ReviewBloc>().add(
                            ReviewStarSelected(selectedStar: model.id ?? "0")),
                        child: Container(
                          alignment: Alignment.center,
                          child: CustomAppText(
                            text: model.value ?? '',
                            style: context.textTheme.headlineLarge!.copyWith(
                              color:
                                  isSelected ? null : context.colors.tertiary,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                kVSizedBox2,
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      var reviewModel = state.filteredRevies?[index];
                      return CustomReviewTileWidget(reviewModel: reviewModel);
                    },
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    separatorBuilder: (context, index) => kVSizedBox2,
                    itemCount: state.filteredRevies?.length ?? 0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    reviewRepository.initReviewScreen(context: context);
  }
}
