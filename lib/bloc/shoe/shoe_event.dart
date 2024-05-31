part of 'shoe_bloc.dart';

class ShoeColorSelected extends ShoeEvent {
  final String? color;
  const ShoeColorSelected({this.color});
}

class ShoeDetailsFetched extends ShoeEvent {
  final String shoeId;

  const ShoeDetailsFetched({required this.shoeId});
}

class ShoeEvent extends Equatable {
  const ShoeEvent();

  @override
  List<Object> get props => [];
}

class ShoeFetched extends ShoeEvent {
  final FilterModel? filterModel;
  final bool hasFilter;

  const ShoeFetched({
    this.filterModel,
    this.hasFilter = true,
  });
}

class ShoeImageSwitched extends ShoeEvent {
  final int index;

  const ShoeImageSwitched({this.index = 0});
}

class ShoeSizeSelected extends ShoeEvent {
  final String? size;
  const ShoeSizeSelected({this.size});
}

class ShoeStepperDecrement extends ShoeEvent {
  final int? index;
  const ShoeStepperDecrement({this.index});
}

class ShoeStepperIncrement extends ShoeEvent {
  final int? index;
  const ShoeStepperIncrement({this.index});
}
