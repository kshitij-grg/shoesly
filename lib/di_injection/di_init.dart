import 'package:get_it/get_it.dart';
import 'package:shoesly/core/services/firebase_service.dart';
import 'package:shoesly/data/data_providers/brand/brand_api_client.dart';

import '../data/data_providers/shoe/shoe_api_client.dart';
import '../data/repositories/brand/brand_repository.dart';
import '../data/repositories/discover/discover_repository.dart';
import '../data/repositories/review/review_repository.dart';
import '../data/repositories/shoe/shoe_repository.dart';
import '../data/repositories/splash/splash_repository.dart';

final di = GetIt.instance;

void initDependencies() {
  // Repositories
  di.registerLazySingleton(() => SplashRepository());
  di.registerLazySingleton(() => BrandRepository());
  di.registerLazySingleton(() => DiscoverRepository());
  di.registerLazySingleton(() => ShoeRepository());
  di.registerLazySingleton(() => ReviewRepository());

  // API clients
  di.registerLazySingleton(() => BrandApiClient());
  di.registerLazySingleton(() => ShoeApiClient());

  di.registerLazySingleton(() => FirebaseService());
}
