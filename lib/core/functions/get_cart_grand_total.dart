import '../../data/models/cart/cart_model.dart';

String getCartGrandTotal(
    {required List<CartModel> cartModelList,
    int shipping = 0,
    bool isShippingInclued = false}) {
  if (cartModelList.isNotEmpty) {
    int total = cartModelList
        .map((e) => ((e.price ?? 0) * (e.quantity ?? 0)))
        .reduce((a, b) => a + b);

    int totalWithShipping = total + shipping;

    return (isShippingInclued ? totalWithShipping : total).toString();
  }

  return "0";
}
