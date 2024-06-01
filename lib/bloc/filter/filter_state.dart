part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final FilterModel? filterModel;
  const FilterState({this.filterModel});

  @override
  List<Object?> get props => [filterModel];

  FilterState copyWith({
    FilterModel? filterModel,
  }) =>
      FilterState(
        filterModel: filterModel ?? this.filterModel,
      );
}
