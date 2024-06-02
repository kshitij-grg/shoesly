part of 'order_bloc.dart';

class OrderAdded extends OrderEvent {
  final List<CartModel>? cartModelList;
  final int shipping;
  const OrderAdded({
    this.cartModelList,
    this.shipping = 0,
  });
}

class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}
