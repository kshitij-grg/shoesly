import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/data/models/brand/brand_model.dart';
import 'package:shoesly/di_injection/get_di_init.dart';

class BrandApiClient {
  Future<List<BrandModel>> fetchBrands() async {
    final ref = firebaseService.firebaseInstance.collection("brands");

    QuerySnapshot querySnapshot = await ref.get();

    final response = querySnapshot.docs
        .map((e) => BrandModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return response;
  }
}
