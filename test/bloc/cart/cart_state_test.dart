import 'package:flutter_test/flutter_test.dart';
import 'package:shoesly/bloc/cart/cart_bloc.dart';
import 'package:shoesly/core/enums/enum.dart';
import 'package:shoesly/data/models/cart/cart_model.dart';

void main() {
  group("CartState", () {
    const mockCartModelList = <CartModel>[];
    const mockCartAddStatus = AppStatus.initial;
    const mockCartDeleteStatus = AppStatus.initial;
    const mockIsShowAdded = false;

    CartState createSubject() {
      return const CartState(
        cartAddStatus: mockCartAddStatus,
        cartDeleteStatus: mockCartDeleteStatus,
        cartModelList: mockCartModelList,
        isShoeAdded: mockIsShowAdded,
      );
    }

    test("suppports value equality", () {
      expect(createSubject(), equals(createSubject()));
    });
    test("props are correct", () {
      expect(
          createSubject().props,
          equals(<Object?>[
            mockCartModelList,
            mockCartAddStatus,
            mockCartDeleteStatus,
            mockIsShowAdded
          ]));
    });

    test("returns object with updated status", () {
      expect(
          createSubject().copyWith(cartAddStatus: AppStatus.success),
          const CartState(
            cartAddStatus: AppStatus.success,
            cartDeleteStatus: mockCartDeleteStatus,
            cartModelList: mockCartModelList,
            isShoeAdded: mockIsShowAdded,
          ));
    });
  });
}
