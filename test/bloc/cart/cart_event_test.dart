import 'package:flutter_test/flutter_test.dart';
import 'package:shoesly/bloc/cart/cart_bloc.dart';
import 'package:shoesly/core/enums/enum.dart';

void main() {
  group("CounterEvent", () {
    group("CartListUpdate", () {
      const mockIndex = 0;
      const mockCartStatus = CartStatus.initial;
      const mockCartModel = null;
      const mockCounterStatus = null;

      CartListUpdated createSubject() {
        return const CartListUpdated(
          cartModel: mockCartModel,
          cartStatus: mockCartStatus,
          counterStatus: mockCounterStatus,
          index: mockIndex,
        );
      }

      test("Supports value equality", () {
        expect(createSubject(), equals(createSubject()));
      });
    });
  });
}
