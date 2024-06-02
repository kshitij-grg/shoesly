part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final String? brand, gender, color;
  final double minPrice, maxPrice;
  final AppStaticModel? sortBy;
  const FilterState({
    this.brand,
    this.gender,
    this.color,
    this.sortBy,
    this.maxPrice = 0,
    this.minPrice = 0,
  });

  @override
  List<Object?> get props => [brand, gender, color, minPrice, maxPrice, sortBy];

  FilterState copyWith({
    String? brand,
    String? gender,
    String? color,
    double? minPrice,
    double? maxPrice,
    AppStaticModel? sortBy,
  }) =>
      FilterState(
        brand: brand ?? this.brand,
        gender: gender ?? this.gender,
        sortBy: sortBy ?? this.sortBy,
        color: color ?? this.color,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
      );
}
