import 'package:get_it/get_it.dart';

import '../data/repositories/splash/splash_repository.dart';

final di = GetIt.instance;

void initDependencies() {
  //Repositories
  di.registerLazySingleton(() => SplashRepository());
}
