import '../../data/models/shoe/shoe_model.dart';

double getAverageRatingValue({required List<Review>? reviewModel}) {
  if (reviewModel?.isEmpty == true) {
    return 0;
  }
  double sum = reviewModel
          ?.map((e) => double.parse(e.rating ?? '0'))
          .reduce((a, b) => a + b) ??
      0;
  double count = double.parse("${reviewModel?.length ?? "0"}");

  return (sum / count).roundToDouble();
}
