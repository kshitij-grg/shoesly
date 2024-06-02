import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/core/configs/api_configs.dart';
import 'package:shoesly/data/models/brand/brand_model.dart';

import '../../../core/handler/base_api_client.dart';

class BrandApiClient {
  Future<List<BrandModel>> fetchBrands() async {
    QuerySnapshot querySnapshot =
        await BaseApiClient.fetch(collection: ApiConfigs.brandUrl);

    final response = querySnapshot.docs
        .map((e) => BrandModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return response;
  }
}
