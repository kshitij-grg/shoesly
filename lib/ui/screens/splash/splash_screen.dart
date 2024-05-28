import 'package:flutter/material.dart';

import '../../../core/utils/system_ui_overlay_style.dart';
import 'components/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle(context),
      child: const Scaffold(body: SplashBody()),
    );
  }
}
