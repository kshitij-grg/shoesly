import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/app/constants/app_texts.dart';
import 'package:shoesly/core/enums/enum.dart';
import 'package:shoesly/core/utils/custom_toasts.dart';
import 'package:shoesly/di_injection/get_di_init.dart';

import '../../data/models/cart/cart_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderState()) {
    on<OrderAdded>(_onOrderAdd);
  }

  _onOrderAdd(OrderAdded event, Emitter<OrderState> emit) async {
    try {
      emit(const OrderState(orderAddStatus: AppStatus.loading));

      var response = await orderRepository.addOrder(
          orderDetails: event.cartModelList ?? [], shipping: event.shipping);

      if (response.isNotEmpty) {
        successToast(message: AppTexts.orderPlaced);
        emit(const OrderState(orderAddStatus: AppStatus.success));
        return emit(const OrderState(orderAddStatus: AppStatus.complete));
      }
      emit(const OrderState(orderAddStatus: AppStatus.error));
    } catch (e) {
      log(e.toString());
    }
  }
}
