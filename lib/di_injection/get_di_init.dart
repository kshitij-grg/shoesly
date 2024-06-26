import 'package:shoesly/core/services/firebase_service.dart';
import 'package:shoesly/data/data_providers/brand/brand_api_client.dart';
import 'package:shoesly/data/data_providers/order/order_api_client.dart';
import 'package:shoesly/data/data_providers/shoe/shoe_api_client.dart';
import 'package:shoesly/data/repositories/brand/brand_repository.dart';
import 'package:shoesly/data/repositories/filter/filter_repository.dart';
import 'package:shoesly/data/repositories/order/order_repository.dart';

import '../data/repositories/discover/discover_repository.dart';
import '../data/repositories/review/review_repository.dart';
import '../data/repositories/shoe/shoe_repository.dart';
import '../data/repositories/splash/splash_repository.dart';
import 'di_init.dart';

final brandApiclient = di.get<BrandApiClient>();
final brandRepository = di.get<BrandRepository>();

final discoverRepository = di.get<DiscoverRepository>();

final filterRepository = di.get<FilterRepository>();

final firebaseService = di.get<FirebaseService>();

final orderApiClient = di.get<OrderApiClient>();
final orderRepository = di.get<OrderRepository>();

final reviewRepository = di.get<ReviewRepository>();

final shoeApiClient = di.get<ShoeApiClient>();

final shoeRepository = di.get<ShoeRepository>();
final splashRepository = di.get<SplashRepository>();
