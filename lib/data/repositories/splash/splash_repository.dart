import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/routes/route_config.dart';
import '../../../core/routes/route_navigator.dart';

class SplashRepository {
  initSplashScreen({required BuildContext context}) {
    Timer(const Duration(seconds: 2), //Assign default 2 sec.
        () async {
      return RouteNavigator.navigateOffAllNamed(
          context.mounted ? context : context, RouteConfig.discoverRoute);
    });
  }
}
