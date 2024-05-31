import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/data/models/app_static/app_static_model.dart';

import '../../../bloc/review/review_bloc.dart';

class ReviewRepository {
  final reviewHeadings = [
    AppStaticModel(
      id: "0",
      value: "All",
    ),
    AppStaticModel(
      id: "5",
      value: "5 Stars",
    ),
    AppStaticModel(
      id: "4",
      value: "4 Stars",
    ),
    AppStaticModel(
      id: "3",
      value: "3 Stars",
    ),
    AppStaticModel(
      id: "2",
      value: "2 Stars",
    ),
    AppStaticModel(
      id: "1",
      value: "1 Star",
    ),
  ];

  initReviewScreen({required BuildContext context}) {
    var reviewBloc = context.read<ReviewBloc>();

    // reviewBloc.add(ReviewDataFetched(reviews: reviews));
    reviewBloc.add(const ReviewStarSelected(selectedStar: "0"));
    reviewBloc.add(const ReviewDataFiltered());
  }
}
