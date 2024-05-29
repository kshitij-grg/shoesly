import 'package:get_it/get_it.dart';
import 'package:shoesly/core/services/firebase_service.dart';
import 'package:shoesly/data/data_providers/brand/brand_api_client.dart';

import '../data/repositories/brand/brand_repository.dart';
import '../data/repositories/discover/discover_repository.dart';
import '../data/repositories/splash/splash_repository.dart';

final di = GetIt.instance;

void initDependencies() {
  // Repositories
  di.registerLazySingleton(() => SplashRepository());
  di.registerLazySingleton(() => BrandRepository());
  di.registerLazySingleton(() => DiscoverRepository());

  // API clients
  di.registerLazySingleton(() => BrandApiClient());

  di.registerLazySingleton(() => FirebaseService());
}
