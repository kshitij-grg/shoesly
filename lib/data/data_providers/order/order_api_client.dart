import 'dart:math';

import 'package:shoesly/core/configs/api_configs.dart';
import 'package:shoesly/core/functions/get_cart_grand_total.dart';
import 'package:shoesly/data/models/cart/cart_model.dart';

import '../../../core/handler/base_api_client.dart';

class OrderApiClient {
  Future<String> addOrder({
    required List<CartModel> orderDetails,
    int? shipping = 0,
  }) async {
    var orderId = Random().nextInt(1000); //generating random number as Id

    Map<String, dynamic> payload = {
      "orderId": orderId.toString(),
      "paymentMethod": "Credit Card",
      "Location": "Semarand, Indonesia",
      "orderDetails": orderDetails
          .map((e) => {
                "name": e.name,
                "brand": e.brandName,
                "color": e.color,
                "size": e.size,
                "quantity": e.quantity,
                "price": e.price,
              })
          .toList(),
      "paymentDetail": {
        "subtotal": getCartGrandTotal(cartModelList: orderDetails),
        "shipping": shipping,
      },
      "totalAmount": getCartGrandTotal(
        cartModelList: orderDetails,
        shipping: shipping ?? 0,
        isShippingInclued: true,
      ),
      "createdAt": DateTime.now(),
    };

    var response = await BaseApiClient.post(
        collection: ApiConfigs.orderUrl, payload: payload);

    return response;
  }
}
