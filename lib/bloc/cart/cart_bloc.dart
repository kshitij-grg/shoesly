import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/enums/enum.dart';

import '../../data/models/cart/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartModelAdded>(_onCartModelAdd);
    on<CartListUpdated>(_onCartListUpdate);
    on<CartListCleared>(_onCartListClear);
  }

  _onCartListClear(CartListCleared event, Emitter<CartState> emit) async {
    emit(const CartState());
  }

  _onCartListUpdate(CartListUpdated event, Emitter<CartState> emit) async {
    switch (event.cartStatus) {
      case CartStatus.add:
        emit(state.copyWith(
            cartModelList: List.from(state.cartModelList ?? [])
              ..add(event.cartModel ?? CartModel()),
            cartAddStatus: AppStatus.success));
        emit(state.copyWith(cartAddStatus: AppStatus.complete));
        break;

      case CartStatus.update:
        int quantity = state.cartModelList?[event.index ?? 0].quantity ?? 0;
        switch (event.counterStatus) {
          case CounterStatus.minus:
            if (quantity > 1) {
              quantity--;
            }
            break;
          default:
            quantity++;
        }

        emit(state.copyWith(
            cartModelList: List.from(state.cartModelList ?? [])
              ..setAll(event.index ?? 0, [
                state.cartModelList?[event.index ?? 0]
                        .copyWith(quantity: quantity) ??
                    CartModel()
              ])));
        break;

      case CartStatus.delete:
        emit(state.copyWith(
            cartModelList: List.from(state.cartModelList ?? [])
              ..removeAt(event.index ?? 0),
            cartDeleteStatus: AppStatus.success));
        emit(state.copyWith(cartDeleteStatus: AppStatus.complete));

        break;
      default:
    }
  }

  _onCartModelAdd(CartModelAdded event, Emitter<CartState> emit) {
    emit(state.copyWith(isShoeAdded: event.isShoeAdded));
  }
}
