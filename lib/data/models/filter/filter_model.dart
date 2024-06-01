class FilterModel {
  final String? brand, sortBy, color, gender;
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
    String? sortBy,
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
