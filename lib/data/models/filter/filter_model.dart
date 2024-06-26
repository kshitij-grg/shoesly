import 'package:shoesly/data/models/app_static/app_static_model.dart';

class FilterModel {
  final String? brand, color, gender;
  final AppStaticModel? sortBy;
  final double? minPrice, maxPrice;

  FilterModel({
    this.brand,
    this.sortBy,
    this.color,
    this.gender,
    this.minPrice,
    this.maxPrice,
  });

  FilterModel copyWith({
    String? brand,
    AppStaticModel? sortBy,
    String? color,
    String? gender,
    double? minPrice,
    double? maxPrice,
  }) =>
      FilterModel(
        brand: brand ?? this.brand,
        sortBy: sortBy ?? this.sortBy,
        color: color ?? this.color,
        gender: gender ?? this.gender,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
      );
}
