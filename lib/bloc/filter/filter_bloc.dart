import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/enums/enum.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<FilterBrandSelected>(_onFilterBrandSelect);
    on<FilterColorSelected>(_onFilterColorSelect);
    on<FilterGenderSelected>(_onFilterGenderSelect);
    on<FilterPriceRangeChanged>(_onFilterPriceRangeChange);
  }

  _onFilterBrandSelect(FilterBrandSelected event, Emitter<FilterState> emit) {
    emit(state.copyWith(brand: event.brand));
  }

  _onFilterColorSelect(FilterColorSelected event, Emitter<FilterState> emit) {
    emit(state.copyWith(color: event.color));
  }

  _onFilterGenderSelect(FilterGenderSelected event, Emitter<FilterState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  _onFilterPriceRangeChange(
      FilterPriceRangeChanged event, Emitter<FilterState> emit) {
    emit(state.copyWith(minPrice: event.minPrice, maxPrice: event.maxPrice));
  }
}
