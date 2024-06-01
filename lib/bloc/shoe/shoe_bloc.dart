import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/data/models/filter/filter_model.dart';
import 'package:shoesly/data/models/shoe/shoe_model.dart';

import '../../core/app/constants/app_texts.dart';
import '../../core/enums/enum.dart';
import '../../core/utils/custom_toasts.dart';
import '../../data/models/cart/cart_model.dart';
import '../../di_injection/get_di_init.dart';
import '../cart/cart_bloc.dart';

part 'shoe_event.dart';
part 'shoe_state.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  ShoeBloc() : super(const ShoeState()) {
    on<ShoeFetched>(_onShoeFetch);
    on<ShoeDetailsFetched>(_onShoeDetailsFetch);
    on<ShoeSizeSelected>(_onShoeSizeSelect);
    on<ShoeImageSwitched>(_onShoeImageSwitch);
    on<ShoeColorSelected>(_onShoeColorSelect);
    on<ShoeCounterDecreased>(_onShoeCounterDecrease);
    on<ShoeCounterIncreased>(_onShoeCounterIncrease);
    on<ShoeCounterReset>(_onShoeCounterReset);
  }

  addShoeToCartList({required BuildContext context}) {
    var model = state.shoeModel;
    if (state.shoeColor != "") {
      if (state.shoeSize != "") {
        return context.read<CartBloc>().add(CartListUpdated(
              cartModel: CartModel(
                name: model?.name,
                brandName: model?.brandInfo?.brandName,
                color: state.shoeColor,
                size: state.shoeSize,
                price: model?.price,
                image: model?.images?.first,
                quantity: state.quantity,
              ),
              cartStatus: CartStatus.add,
            ));
      }
      return errorToast(msg: AppTexts.emptyShoeSize, context: context);
    }
    return errorToast(msg: AppTexts.emptyShoeColor, context: context);
  }

  _onShoeColorSelect(ShoeColorSelected event, Emitter<ShoeState> emit) async {
    emit(state.copyWith(
        shoeColor: event.color, colorSelectStatus: AppStatus.success));
    emit(state.copyWith(colorSelectStatus: AppStatus.complete));
  }

  _onShoeCounterDecrease(
      ShoeCounterDecreased event, Emitter<ShoeState> emit) async {
    if (state.quantity > 1) {
      int counter = state.quantity;
      counter--;
      emit(state.copyWith(quantity: counter));
    }
  }

  _onShoeCounterIncrease(
      ShoeCounterIncreased event, Emitter<ShoeState> emit) async {
    int counter = state.quantity;
    counter++;
    emit(state.copyWith(quantity: counter));
  }

  _onShoeCounterReset(ShoeCounterReset event, Emitter<ShoeState> emit) async {
    emit(state.copyWith(quantity: event.index));
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
}
