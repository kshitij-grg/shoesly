class CartModel {
  final String? image, name, brandName, color, size;
  final int? price, quantity;

  CartModel({
    this.image,
    this.brandName,
    this.name,
    this.color,
    this.price,
    this.quantity,
    this.size,
  });

  CartModel copyWith({
    String? name,
    String? image,
    String? brandName,
    String? color,
    String? size,
    int? price,
    int? quantity,
  }) =>
      CartModel(
        name: name ?? this.name,
        image: image ?? this.image,
        brandName: brandName ?? this.brandName,
        color: color ?? this.color,
        size: size ?? this.size,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
      );
}
