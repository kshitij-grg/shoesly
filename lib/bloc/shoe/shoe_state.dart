part of 'shoe_bloc.dart';

class ShoeState extends Equatable {
  final AppStatus fetchShoeStatus, fetchShoeDetailsStatus, shoeSelectStatus;
  final List<ShoeModel>? shoeModelList;
  final ShoeModel? shoeModel;
  final String? shoeSize;

  const ShoeState({
    this.fetchShoeStatus = AppStatus.initial,
    this.fetchShoeDetailsStatus = AppStatus.initial,
    this.shoeSelectStatus = AppStatus.initial,
    this.shoeModelList,
    this.shoeModel,
    this.shoeSize,
  });

  @override
  List<Object?> get props => [
        fetchShoeStatus,
        shoeSize,
        shoeModelList,
        fetchShoeDetailsStatus,
        shoeModel,
        shoeSelectStatus
      ];

  ShoeState copyWith({
    AppStatus? fetchShoeStatus,
    AppStatus? fetchShoeDetailsStatus,
    AppStatus? shoeSelectStatus,
    List<ShoeModel>? shoeModelList,
    ShoeModel? shoeModel,
    String? shoeSize,
  }) =>
      ShoeState(
        fetchShoeStatus: fetchShoeStatus ?? this.fetchShoeStatus,
        shoeSelectStatus: shoeSelectStatus ?? this.shoeSelectStatus,
        shoeSize: shoeSize ?? this.shoeSize,
        shoeModelList: shoeModelList ?? this.shoeModelList,
        fetchShoeDetailsStatus:
            fetchShoeDetailsStatus ?? this.fetchShoeDetailsStatus,
        shoeModel: shoeModel ?? this.shoeModel,
      );
}
