import 'package:shoesly/core/services/firebase_service.dart';
import 'package:shoesly/data/data_providers/brand/brand_api_client.dart';
import 'package:shoesly/data/repositories/brand/brand_repository.dart';

import '../data/repositories/discover/discover_repository.dart';
import '../data/repositories/splash/splash_repository.dart';
import 'di_init.dart';

final brandApiclient = di.get<BrandApiClient>();
final brandRepository = di.get<BrandRepository>();

final discoverRepository = di.get<DiscoverRepository>();

final firebaseService = di.get<FirebaseService>();

final splashRepository = di.get<SplashRepository>();
