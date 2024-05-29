part of 'brand_bloc.dart';

class BrandState extends Equatable {
  final AppStatus brandStatus;
  final List<BrandModel>? brandModelList;

  const BrandState({
    this.brandStatus = AppStatus.initial,
    this.brandModelList,
  });

  @override
  List<Object?> get props => [brandStatus, brandModelList];

  BrandState copyWith({
    AppStatus? brandStatus,
    List<BrandModel>? brandModelList,
  }) =>
      BrandState(
        brandStatus: brandStatus ?? this.brandStatus,
        brandModelList: brandModelList ?? this.brandModelList,
      );
}
