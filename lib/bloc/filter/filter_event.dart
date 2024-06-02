part of 'filter_bloc.dart';

class FilterBrandSelected extends FilterEvent {
  final String? brand;
  const FilterBrandSelected({this.brand});
}

class FilterColorSelected extends FilterEvent {
  final String? color;
  const FilterColorSelected({this.color});
}

class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterGenderSelected extends FilterEvent {
  final String? gender;
  const FilterGenderSelected({this.gender});
}

class FilterPriceRangeChanged extends FilterEvent {
  final double minPrice, maxPrice;
  const FilterPriceRangeChanged({this.minPrice = 0, this.maxPrice = 0});
}

class FilterSortBySelected extends FilterEvent {
  final AppStaticModel? sortbyModel;
  const FilterSortBySelected({this.sortbyModel});
}

class FilterValuesReset extends FilterEvent {}
