part of 'shoe_bloc.dart';

class ShoeColorSelected extends ShoeEvent {
  final String? color;
  const ShoeColorSelected({this.color});
}

class ShoeCounterDecreased extends ShoeEvent {}

class ShoeCounterIncreased extends ShoeEvent {}

class ShoeCounterReset extends ShoeEvent {
  final int index;

  const ShoeCounterReset({this.index = 1});
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
