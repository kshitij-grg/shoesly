import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/core/configs/api_configs.dart';
import 'package:shoesly/data/models/filter/filter_model.dart';
import 'package:shoesly/data/models/shoe/shoe_model.dart';

import '../../../core/handler/base_api_client.dart';

class ShoeApiClient {
  Future<ShoeModel> fetchShoeDetails({required String shoeId}) async {
    DocumentSnapshot documentSnapshot = await BaseApiClient.fetch(
        collection: ApiConfigs.shoeUrl, docId: shoeId);

    final response =
        ShoeModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);

    return response;
  }

  Future<List<ShoeModel>> fetchShoes(
      {FilterModel? filterModel, bool hasFilter = true}) async {
    QuerySnapshot querySnapshot = await BaseApiClient.fetch(
      collection: ApiConfigs.shoeUrl,
      queryData: filterModel,
      hasQuery: hasFilter,
    );
    final response = querySnapshot.docs.map((e) {
      var shoeDetailsData = e.data() as Map<String, dynamic>;
      shoeDetailsData["id"] = e.id;
      return ShoeModel.fromJson(shoeDetailsData);
    }).toList();

    return response;
  }
}
