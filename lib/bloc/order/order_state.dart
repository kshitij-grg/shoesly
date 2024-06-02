part of 'order_bloc.dart';

class OrderState extends Equatable {
  final AppStatus orderAddStatus;

  const OrderState({
    this.orderAddStatus = AppStatus.initial,
  });

  @override
  List<Object> get props => [
        orderAddStatus,
      ];
}
