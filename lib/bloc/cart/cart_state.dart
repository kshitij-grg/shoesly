part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartModel>? cartModelList;
  final AppStatus cartAddStatus, cartDeleteStatus;
  final bool isShoeAdded;
  const CartState({
    this.cartModelList,
    this.isShoeAdded = false,
    this.cartAddStatus = AppStatus.initial,
    this.cartDeleteStatus = AppStatus.initial,
  });

  @override
  List<Object?> get props =>
      [cartModelList, cartAddStatus, cartDeleteStatus, isShoeAdded];

  CartState copyWith({
    List<CartModel>? cartModelList,
    AppStatus? cartAddStatus,
    AppStatus? cartDeleteStatus,
    bool? isShoeAdded,
  }) =>
      CartState(
        cartModelList: cartModelList ?? this.cartModelList,
        cartAddStatus: cartAddStatus ?? this.cartAddStatus,
        isShoeAdded: isShoeAdded ?? this.isShoeAdded,
        cartDeleteStatus: cartDeleteStatus ?? this.cartDeleteStatus,
      );
}
