import 'dart:convert';

BrandModel brandModelFromJson(String str) =>
    BrandModel.fromJson(json.decode(str));

// List<BrandModel> brandModelFromJson(String str) =>
//     List<BrandModel>.from(json.decode(str).map((x) => BrandModel.fromJson(x)));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  final String? id;
  final String? icon;
  final String? name;
  final int? quantity;

  BrandModel({
    this.id,
    this.icon,
    this.name,
    this.quantity,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json["id"],
        icon: json["icon"],
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "name": name,
        "quantity": quantity,
      };
}
