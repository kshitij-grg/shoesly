import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/data/models/filter/filter_model.dart';
import 'package:shoesly/data/models/shoe/shoe_model.dart';

import '../../core/enums/enum.dart';
import '../../di_injection/get_di_init.dart';

part 'shoe_event.dart';
part 'shoe_state.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  ShoeBloc() : super(const ShoeState()) {
    on<ShoeFetched>(_onShoeFetch);
    on<ShoeDetailsFetched>(_onShoeDetailsFetch);
    on<ShoeSizeSelected>(_onShoeSizeSelect);
    on<ShoeImageSwitched>(_onShoeImageSwitch);
    on<ShoeColorSelected>(_onShoeColorSelect);
    on<ShoeStepperDecrement>(_onShoeStepperDecrement);
    on<ShoeStepperIncrement>(_onShoeStepperIncrement);
  }

  _onShoeColorSelect(ShoeColorSelected event, Emitter<ShoeState> emit) async {
    emit(state.copyWith(
        shoeColor: event.color, colorSelectStatus: AppStatus.success));
    emit(state.copyWith(colorSelectStatus: AppStatus.complete));
  }

  _onShoeDetailsFetch(ShoeDetailsFetched event, Emitter<ShoeState> emit) async {
    try {
      emit(state.copyWith(fetchShoeDetailsStatus: AppStatus.loading));
      var response =
          await shoeRepository.fetchShoeDetails(shoeId: event.shoeId);

      if (response.id?.isNotEmpty == true) {
        emit(state.copyWith(
            shoeModel: response, fetchShoeDetailsStatus: AppStatus.success));
        return emit(state.copyWith(fetchShoeDetailsStatus: AppStatus.complete));
      }
      emit(state.copyWith(fetchShoeDetailsStatus: AppStatus.error));
    } catch (e) {
      log(e.toString());
    }
  }

  _onShoeFetch(ShoeFetched event, Emitter<ShoeState> emit) async {
    try {
      emit(state.copyWith(fetchShoeStatus: AppStatus.loading));
      var response = await shoeRepository.fetchShoes(
          filterModel: event.filterModel, hasFilter: event.hasFilter);

      if (response.isNotEmpty) {
        emit(state.copyWith(
            shoeModelList: response, fetchShoeStatus: AppStatus.success));
        return emit(state.copyWith(fetchShoeStatus: AppStatus.complete));
      }
      emit(state.copyWith(fetchShoeStatus: AppStatus.error));
    } catch (e) {
      log(e.toString());
    }
  }

  _onShoeImageSwitch(ShoeImageSwitched event, Emitter<ShoeState> emit) {
    emit(state.copyWith(imageIndex: event.index));
  }

  _onShoeSizeSelect(ShoeSizeSelected event, Emitter<ShoeState> emit) async {
    emit(state.copyWith(
        shoeSize: event.size, sizeSelectStatus: AppStatus.success));
    emit(state.copyWith(sizeSelectStatus: AppStatus.complete));
  }

  _onShoeStepperDecrement(
      ShoeStepperDecrement event, Emitter<ShoeState> emit) async {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: event.index));
    }
  }

  _onShoeStepperIncrement(
      ShoeStepperIncrement event, Emitter<ShoeState> emit) async {
    emit(state.copyWith(quantity: event.index));
  }
}
