// Import necessary packages
import 'package:bloc_test/bloc_test.dart'; // Optional: for easier bloc testing
import 'package:flutter_test/flutter_test.dart';
import 'package:shoesly/bloc/cart/cart_bloc.dart';
import 'package:shoesly/core/enums/enum.dart';
import 'package:shoesly/data/models/cart/cart_model.dart';

void main() {
  CartModel mockCartModel = CartModel();
  CartStatus mockCartStatus = CartStatus.add;
  const mockCartModelList = null;
  const mockCartAddStatus = AppStatus.initial;
  const mockCartDeleteStatus = AppStatus.initial;
  group('CartBloc', () {
    late CartBloc cartBloc;

    setUp(() {
      cartBloc = CartBloc();
    });

    blocTest<CartBloc, CartState>(
      'emits [initial] when CartModelAdded is added',
      build: () => cartBloc,
      act: (bloc) => bloc.add(const CartModelAdded(isShoeAdded: true)),
      expect: () => [
        const CartState(
          cartModelList: mockCartModelList,
          cartAddStatus: mockCartAddStatus,
          cartDeleteStatus: mockCartDeleteStatus,
          isShoeAdded: true,
        )
      ],
    );

    blocTest<CartBloc, CartState>(
      'emits [CartState with updated cartModelList and cartAddStatus] when CartListUpdated with add status is added',
      build: () => cartBloc,
      seed: () => const CartState(),
      act: (bloc) => bloc.add(CartListUpdated(
          cartModel: mockCartModel, cartStatus: mockCartStatus)),
      expect: () => [
        CartState(
          cartModelList: [mockCartModel],
          cartAddStatus: AppStatus.success,
        ),
        CartState(
            cartModelList: [mockCartModel], cartAddStatus: AppStatus.complete),
      ],
    );

    blocTest<CartBloc, CartState>(
      'emits [CartState with updated cartModelList and cartDeleteStatus] when CartListUpdated with delete status is added',
      build: () => cartBloc,
      seed: () => CartState(cartModelList: [mockCartModel]),
      act: (bloc) => bloc
          .add(const CartListUpdated(cartStatus: CartStatus.delete, index: 0)),
      expect: () => [
        const CartState(cartModelList: [], cartDeleteStatus: AppStatus.success),
        const CartState(
            cartModelList: [], cartDeleteStatus: AppStatus.complete),
      ],
    );

    blocTest(
      'emits New CartState',
      build: () => cartBloc,
      act: (bloc) => bloc.add(CartListCleared()),
      expect: () => [const CartState()],
    );
  });
}
