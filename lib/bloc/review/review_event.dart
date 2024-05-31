part of 'review_bloc.dart';

class ReviewDataFetched extends ReviewEvent {
  final List<Review>? reviews;
  const ReviewDataFetched({this.reviews});
}

class ReviewDataFiltered extends ReviewEvent {
  const ReviewDataFiltered();
}

class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

class ReviewStarSelected extends ReviewEvent {
  final String selectedStar;

  const ReviewStarSelected({this.selectedStar = "0"});
}
