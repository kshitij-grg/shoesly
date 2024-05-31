part of 'review_bloc.dart';

class ReviewState extends Equatable {
  final List<Review>? reviews, filteredRevies;
  final String selectedStar;
  final AppStatus starSelectedStatus;

  const ReviewState({
    this.reviews,
    this.filteredRevies,
    this.selectedStar = "0",
    this.starSelectedStatus = AppStatus.initial,
  });

  @override
  List<Object?> get props => [
        reviews,
        selectedStar,
        starSelectedStatus,
        filteredRevies,
      ];

  ReviewState copyWith({
    List<Review>? reviews,
    List<Review>? filteredRevies,
    String? selectedStar,
    AppStatus? starSelectedStatus,
  }) =>
      ReviewState(
        reviews: reviews ?? this.reviews,
        filteredRevies: filteredRevies ?? this.filteredRevies,
        starSelectedStatus: starSelectedStatus ?? this.starSelectedStatus,
        selectedStar: selectedStar ?? this.selectedStar,
      );
}
