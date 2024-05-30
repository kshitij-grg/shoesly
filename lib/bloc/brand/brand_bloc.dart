import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/enums/enum.dart';
import 'package:shoesly/di_injection/get_di_init.dart';

import '../../data/models/brand/brand_model.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  BrandBloc() : super(const BrandState()) {
    on<BrandFetched>(_onBrandFetch);
    on<BrandSelected>(_onBrandSelect);
  }

  _onBrandFetch(BrandFetched event, Emitter<BrandState> emit) async {
    try {
      emit(state.copyWith(fetchBrandStatus: AppStatus.loading));
      var response =
          await brandRepository.fetchBrands(hasAllKeyword: event.hasAllKeyword);

      if (response.isNotEmpty) {
        emit(state.copyWith(
            brandModelList: response, fetchBrandStatus: AppStatus.success));
        return emit(state.copyWith(fetchBrandStatus: AppStatus.complete));
      }
      emit(state.copyWith(fetchBrandStatus: AppStatus.error));
    } catch (e) {
      log(e.toString());
    }
  }

  _onBrandSelect(BrandSelected event, Emitter<BrandState> emit) {
    emit(state.copyWith(
        selectedBrand: event.selectedBrand,
        brandSelectedstatus: AppStatus.success));
    emit(state.copyWith(brandSelectedstatus: AppStatus.complete));
  }
}
