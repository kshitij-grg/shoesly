import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/data/models/filter/filter_model.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<FilterValueSelected>(_onFilterValueSelect);
  }

  _onFilterValueSelect(FilterValueSelected event, Emitter<FilterState> emit) {
    emit(state.copyWith(filterModel: event.filterModel));
  }
}
