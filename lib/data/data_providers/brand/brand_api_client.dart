import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/data/models/brand/brand_model.dart';
import 'package:shoesly/di_injection/get_di_init.dart';

import '../../../core/app/constants/app_texts.dart';

class BrandApiClient {
  Future<List<BrandModel>> fetchBrands({bool hasAllKeyword = false}) async {
    List<BrandModel> responseWithAll = [];
    List<BrandModel> tempResponse = [];

    final ref = firebaseService.firebaseInstance.collection("brands");

    QuerySnapshot querySnapshot = await ref.get();

    final response = querySnapshot.docs
        .map((e) => BrandModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    if (hasAllKeyword) {
      tempResponse = response;
      responseWithAll = tempResponse..insert(0, BrandModel(name: AppTexts.all));
    }

    return hasAllKeyword ? responseWithAll : response;
  }
}
