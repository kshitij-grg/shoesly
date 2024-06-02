import 'package:shoesly/di_injection/get_di_init.dart';

import '../../models/cart/cart_model.dart';

class OrderRepository {
  Future<String> addOrder(
          {required List<CartModel> orderDetails, int shipping = 0}) =>
      orderApiClient.addOrder(orderDetails: orderDetails, shipping: shipping);
}
