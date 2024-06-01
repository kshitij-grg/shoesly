part of 'filter_bloc.dart';

class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterValueSelected extends FilterEvent {
  final FilterModel? filterModel;
  const FilterValueSelected({this.filterModel});
}
