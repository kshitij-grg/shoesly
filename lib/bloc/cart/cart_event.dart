part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartListCleared extends CartEvent {}

class CartListUpdated extends CartEvent {
  final int? index;
  final CartStatus? cartStatus;
  final CartModel? cartModel;
  final CounterStatus? counterStatus;
  const CartListUpdated({
    this.index,
    this.cartStatus,
    this.cartModel,
    this.counterStatus,
  });
}

class CartModelAdded extends CartEvent {
  final bool isShoeAdded;

  const CartModelAdded({this.isShoeAdded = false});
}
