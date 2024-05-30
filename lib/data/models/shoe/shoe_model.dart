import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ShoeModel shoeModelFromJson(String str) => ShoeModel.fromJson(json.decode(str));

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
  final DateTime? createAt;
  final String? description;

  Review({
    this.username,
    this.image,
    this.rating,
    this.createAt,
    this.description,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        username: json["username"],
        image: json["image"],
        rating: json["rating"],
        description: json["description"],
        createAt: json["createAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                (json["createAt"] as Timestamp).millisecondsSinceEpoch),
      );
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
  final String? gender;
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
    this.gender,
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
            : DateTime.fromMillisecondsSinceEpoch(
                (json["createdAt"] as Timestamp).millisecondsSinceEpoch),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        description: json["description"],
        name: json["name"],
        gender: json["gender"],
        availableQuantity: json["availableQuantity"],
        price: json["price"],
        id: json["id"],
        sizes: json["sizes"] == null
            ? []
            : List<String>.from(json["sizes"]!.map((x) => x)),
      );
}
