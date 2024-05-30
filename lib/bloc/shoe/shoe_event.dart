part of 'shoe_bloc.dart';

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

class ShoeSizeSelected extends ShoeEvent {
  final String? size;
  const ShoeSizeSelected({this.size});
}
