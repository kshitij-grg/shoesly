import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/enums/enum.dart';

import '../../data/models/shoe/shoe_model.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(const ReviewState()) {
    on<ReviewDataFetched>(_onReviewDataFetch);
    on<ReviewStarSelected>(_onReviewStarSelect);
    on<ReviewDataFiltered>(_onReviewDataFilter);
  }

  _onReviewDataFetch(ReviewDataFetched event, Emitter<ReviewState> emit) {
    emit(state.copyWith(reviews: event.reviews));
  }

  _onReviewDataFilter(ReviewDataFiltered event, Emitter<ReviewState> emit) {
    try {
      if (state.selectedStar == "0") {
        return emit(state.copyWith(filteredRevies: state.reviews));
      }
      emit(state.copyWith(
        filteredRevies: state.reviews
            ?.where((element) => element.rating == state.selectedStar)
            .toList(),
      ));
    } catch (e) {
      log(e.toString());
    }
  }

  _onReviewStarSelect(ReviewStarSelected event, Emitter<ReviewState> emit) {
    emit(state.copyWith(
        selectedStar: event.selectedStar,
        starSelectedStatus: AppStatus.success));
    emit(state.copyWith(starSelectedStatus: AppStatus.complete));
  }
}
