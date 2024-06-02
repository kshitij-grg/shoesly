import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/data/models/app_static/app_static_model.dart';
import 'package:shoesly/data/models/filter/filter_model.dart';

import '../shoe/shoe_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<FilterBrandSelected>(_onFilterBrandSelect);
    on<FilterColorSelected>(_onFilterColorSelect);
    on<FilterGenderSelected>(_onFilterGenderSelect);
    on<FilterPriceRangeChanged>(_onFilterPriceRangeChange);
    on<FilterValuesReset>(_onFilterValuesReset);
    on<FilterSortBySelected>(_onFilterSortBySelect);
  }

  saveFilterValues({required BuildContext context}) {
    context.read<ShoeBloc>().add(ShoeFetched(
            filterModel: FilterModel(
          brand: state.brand,
          color: state.color,
          gender: state.gender,
          maxPrice: state.maxPrice,
          minPrice: state.minPrice,
          sortBy: state.sortBy,
        )));
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

  _onFilterSortBySelect(FilterSortBySelected event, Emitter<FilterState> emit) {
    emit(state.copyWith(sortBy: event.sortbyModel));
  }

  _onFilterValuesReset(FilterValuesReset event, Emitter<FilterState> emit) {
    emit(const FilterState());
  }
}
