part of 'shoe_bloc.dart';

class ShoeState extends Equatable {
  final AppStatus fetchShoeStatus,
      fetchShoeDetailsStatus,
      sizeSelectStatus,
      colorSelectStatus;
  final List<ShoeModel>? shoeModelList;
  final ShoeModel? shoeModel;
  final String? shoeSize, shoeColor;
  final int imageIndex;

  const ShoeState({
    this.fetchShoeStatus = AppStatus.initial,
    this.fetchShoeDetailsStatus = AppStatus.initial,
    this.sizeSelectStatus = AppStatus.initial,
    this.colorSelectStatus = AppStatus.initial,
    this.shoeModelList,
    this.shoeModel,
    this.shoeSize,
    this.shoeColor,
    this.imageIndex = 0,
  });

  @override
  List<Object?> get props => [
        fetchShoeStatus,
        shoeSize,
        shoeModelList,
        fetchShoeDetailsStatus,
        shoeModel,
        shoeColor,
        sizeSelectStatus,
        colorSelectStatus,
        imageIndex
      ];

  ShoeState copyWith({
    AppStatus? fetchShoeStatus,
    AppStatus? fetchShoeDetailsStatus,
    AppStatus? sizeSelectStatus,
    AppStatus? colorSelectStatus,
    List<ShoeModel>? shoeModelList,
    ShoeModel? shoeModel,
    String? shoeSize,
    String? shoeColor,
    int? imageIndex,
  }) =>
      ShoeState(
        fetchShoeStatus: fetchShoeStatus ?? this.fetchShoeStatus,
        sizeSelectStatus: sizeSelectStatus ?? this.sizeSelectStatus,
        shoeColor: shoeColor ?? this.shoeColor,
        colorSelectStatus: colorSelectStatus ?? this.colorSelectStatus,
        shoeSize: shoeSize ?? this.shoeSize,
        shoeModelList: shoeModelList ?? this.shoeModelList,
        imageIndex: imageIndex ?? this.imageIndex,
        fetchShoeDetailsStatus:
            fetchShoeDetailsStatus ?? this.fetchShoeDetailsStatus,
        shoeModel: shoeModel ?? this.shoeModel,
      );
}
