import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/data/models/filter/filter_model.dart';
import 'package:shoesly/data/models/shoe/shoe_model.dart';

import '../../../di_injection/get_di_init.dart';

class ShoeApiClient {
  Future<ShoeModel> fetchShoeDetails({required String shoeId}) async {
    final ref =
        firebaseService.firebaseInstance.collection("shoes").doc(shoeId);

    DocumentSnapshot documentSnapshot = await ref.get();

    final response =
        ShoeModel.fromJson(documentSnapshot as Map<String, dynamic>);

    return response;
  }

  Future<List<ShoeModel>> fetchShoes(
      {FilterModel? filterModel, bool hasFilter = true}) async {
    final ref = firebaseService.firebaseInstance.collection("shoes");

    Query<Map<String, dynamic>> filteredData =
        hasFilter ? filteredShoes(filterModel, ref) : ref;

    QuerySnapshot querySnapshot = await filteredData.get();

    final response = querySnapshot.docs
        .map((e) => ShoeModel.fromJson(
            (e.data() as Map<String, dynamic>).update("id", (value) => e.id)))
        .toList();

    return response;
  }

  Query<Map<String, dynamic>> filteredShoes(
      FilterModel? filterModel, CollectionReference<Map<String, dynamic>> ref) {
    return ref
        .where("brandInfo.brandName", isEqualTo: filterModel?.brand)
        .where("colors", arrayContains: filterModel?.color)
        .where("gender", isEqualTo: filterModel?.gender);
  }
}
