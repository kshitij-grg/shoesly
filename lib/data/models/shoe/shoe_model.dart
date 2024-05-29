import 'dart:convert';

ShoeModel shoeModelFromJson(String str) => ShoeModel.fromJson(json.decode(str));

String shoeModelToJson(ShoeModel data) => json.encode(data.toJson());

class BrandInfo {
  final String? brandImage;
  final String? brandName;

  BrandInfo({
    this.brandImage,
    this.brandName,
  });

  factory BrandInfo.fromJson(Map<String, dynamic> json) => BrandInfo(
        brandImage: json["brandImage"],
        brandName: json["brandName"],
      );

  Map<String, dynamic> toJson() => {
        "brandImage": brandImage,
        "brandName": brandName,
      };
}

class Review {
  final String? username;
  final String? image;
  final String? rating;
  final String? description;

  Review({
    this.username,
    this.image,
    this.rating,
    this.description,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        username: json["username"],
        image: json["image"],
        rating: json["rating"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "image": image,
        "rating": rating,
        "description": description,
      };
}

class ShoeModel {
  final List<Review>? reviews;
  final BrandInfo? brandInfo;
  final List<String>? colors;
  final DateTime? createdAt;
  final List<String>? images;
  final String? description;
  final String? name;
  final int? availableQuantity;
  final int? price;
  final String? id;
  final List<String>? sizes;

  ShoeModel({
    this.reviews,
    this.brandInfo,
    this.colors,
    this.createdAt,
    this.images,
    this.description,
    this.name,
    this.availableQuantity,
    this.price,
    this.id,
    this.sizes,
  });

  factory ShoeModel.fromJson(Map<String, dynamic> json) => ShoeModel(
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        brandInfo: json["brandInfo"] == null
            ? null
            : BrandInfo.fromJson(json["brandInfo"]),
        colors: json["colors"] == null
            ? []
            : List<String>.from(json["colors"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        description: json["description"],
        name: json["name"],
        availableQuantity: json["availableQuantity"],
        price: json["price"],
        id: json["id"],
        sizes: json["sizes"] == null
            ? []
            : List<String>.from(json["sizes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "brandInfo": brandInfo?.toJson(),
        "colors":
            colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "description": description,
        "name": name,
        "availableQuantity": availableQuantity,
        "price": price,
        "id": id,
        "sizes": sizes == null ? [] : List<dynamic>.from(sizes!.map((x) => x)),
      };
}
