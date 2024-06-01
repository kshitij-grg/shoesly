import 'package:flutter/material.dart';
import 'package:shoesly/core/routes/route_config.dart';
import 'package:shoesly/ui/screens/discover/discover_screen.dart';
import 'package:shoesly/ui/screens/filter/filter_screen.dart';
import 'package:shoesly/ui/screens/order/order_screen.dart';

import '../../ui/screens/cart/cart_screen.dart';
import '../../ui/screens/shoe/shoe_screen.dart';
import '../../ui/screens/splash/splash_screen.dart';

// Class to navigate to the screens based on the route values
class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      RouteConfig.initialRoute =>
        MaterialPageRoute(builder: (_) => const SplashScreen()),
      RouteConfig.discoverRoute =>
        MaterialPageRoute(builder: (_) => const DiscoverScreen()),
      RouteConfig.filterRoute =>
        MaterialPageRoute(builder: (_) => const FilterScreen()),
      RouteConfig.cartRoute =>
        MaterialPageRoute(builder: (_) => const CartScreen()),
      RouteConfig.orderRoute =>
        MaterialPageRoute(builder: (_) => const OrderScreen()),
      RouteConfig.shoeRoute => MaterialPageRoute(
          builder: (_) => const ShoeScreen(), settings: settings),
      _ => null
    };
  }
}
