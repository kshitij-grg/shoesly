part of 'brand_bloc.dart';

class BrandState extends Equatable {
  final AppStatus fetchBrandStatus, brandSelectedstatus;
  final List<BrandModel>? brandModelList, brandModelListWithAll;
  final String? selectedBrand;

  const BrandState({
    this.fetchBrandStatus = AppStatus.initial,
    this.brandSelectedstatus = AppStatus.initial,
    this.brandModelList,
    this.selectedBrand,
    this.brandModelListWithAll,
  });

  @override
  List<Object?> get props => [
        fetchBrandStatus,
        brandModelList,
        selectedBrand,
        brandSelectedstatus,
        brandModelListWithAll
      ];

  BrandState copyWith({
    AppStatus? fetchBrandStatus,
    AppStatus? brandSelectedstatus,
    List<BrandModel>? brandModelList,
    List<BrandModel>? brandModelListWithAll,
    String? selectedBrand,
  }) =>
      BrandState(
        fetchBrandStatus: fetchBrandStatus ?? this.fetchBrandStatus,
        brandSelectedstatus: brandSelectedstatus ?? this.brandSelectedstatus,
        brandModelListWithAll:
            brandModelListWithAll ?? this.brandModelListWithAll,
        brandModelList: brandModelList ?? this.brandModelList,
        selectedBrand: selectedBrand ?? this.selectedBrand,
      );
}
