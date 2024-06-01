import 'package:shoesly/data/models/brand/brand_model.dart';
import 'package:shoesly/di_injection/get_di_init.dart';

class BrandRepository {
  Future<List<BrandModel>> fetchBrands() => brandApiclient.fetchBrands();
}
