part of 'brand_bloc.dart';

class BrandState extends Equatable {
  final AppStatus fetchBrandStatus, brandSelectedstatus;
  final List<BrandModel>? brandModelList;
  final String? selectedBrand;

  const BrandState({
    this.fetchBrandStatus = AppStatus.initial,
    this.brandSelectedstatus = AppStatus.initial,
    this.brandModelList,
    this.selectedBrand,
  });

  @override
  List<Object?> get props =>
      [fetchBrandStatus, brandModelList, selectedBrand, brandSelectedstatus];

  BrandState copyWith({
    AppStatus? fetchBrandStatus,
    AppStatus? brandSelectedstatus,
    List<BrandModel>? brandModelList,
    String? selectedBrand,
  }) =>
      BrandState(
        fetchBrandStatus: fetchBrandStatus ?? this.fetchBrandStatus,
        brandSelectedstatus: brandSelectedstatus ?? this.brandSelectedstatus,
        brandModelList: brandModelList ?? this.brandModelList,
        selectedBrand: selectedBrand ?? this.selectedBrand,
      );
}
