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
  }

  _onBrandFetch(BrandFetched event, Emitter<BrandState> emit) async {
    try {
      emit(state.copyWith(brandStatus: AppStatus.loading));
      var response = await brandRepository.fetchBrands();

      if (response.isNotEmpty) {
        emit(state.copyWith(
            brandModelList: response, brandStatus: AppStatus.success));
        emit(state.copyWith(brandStatus: AppStatus.complete));
      }
      emit(state.copyWith(brandStatus: AppStatus.error));
    } catch (e) {
      log(e.toString());
    }
  }
}
