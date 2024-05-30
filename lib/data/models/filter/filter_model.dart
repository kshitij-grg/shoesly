class FilterModel {
  final String? brand, sortBy, color, gender;
  final int? minPrice, maxPrice;

  FilterModel({
    this.brand,
    this.sortBy,
    this.color,
    this.gender,
    this.minPrice,
    this.maxPrice,
  });
}
