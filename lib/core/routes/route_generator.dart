import 'package:flutter/material.dart';
import 'package:shoesly/core/routes/route_config.dart';
import 'package:shoesly/ui/screens/discover/discover_screen.dart';

import '../../ui/screens/splash/splash_screen.dart';

// Class to navigate to the screens based on the route values
class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      RouteConfig.initialRoute =>
        MaterialPageRoute(builder: (_) => const SplashScreen()),
      RouteConfig.discoverRoute =>
        MaterialPageRoute(builder: (_) => const DiscoverScreen()),
      _ => null
    };
  }
}
