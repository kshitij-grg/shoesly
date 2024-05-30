part of 'brand_bloc.dart';

sealed class BrandEvent extends Equatable {
  const BrandEvent();

  @override
  List<Object> get props => [];
}

class BrandFetched extends BrandEvent {
  final bool hasAllKeyword;

  const BrandFetched({this.hasAllKeyword = false});
}

class BrandSelected extends BrandEvent {
  final String? selectedBrand;
  const BrandSelected({this.selectedBrand});
}
