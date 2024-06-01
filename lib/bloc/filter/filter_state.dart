part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final String? brand, gender, color;
  final double? minPrice, maxPrice;
  final AppStatus filterSelectStatus;
  const FilterState({
    this.brand,
    this.gender,
    this.color,
    this.maxPrice,
    this.minPrice,
    this.filterSelectStatus = AppStatus.initial,
  });

  @override
  List<Object?> get props => [brand, gender, color, minPrice, maxPrice];

  FilterState copyWith({
    String? brand,
    String? gender,
    String? color,
    double? minPrice,
    double? maxPrice,
    AppStatus? filterSelectStatus,
  }) =>
      FilterState(
        brand: brand ?? this.brand,
        gender: gender ?? this.gender,
        color: color ?? this.color,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        filterSelectStatus: filterSelectStatus ?? this.filterSelectStatus,
      );
}
