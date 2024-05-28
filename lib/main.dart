import 'package:flutter/material.dart';

import 'core/app/constants/app_texts.dart';
import 'core/app/theme/app_theme.dart';
import 'core/routes/route_config.dart';
import 'core/routes/route_generator.dart';
import 'core/utils/font_scale.dart';
import 'di_injection/di_init.dart';

void main() async {
  await initServices();
  runApp(const ShoeslyApp());
}

initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
}

class ShoeslyApp extends StatelessWidget {
  const ShoeslyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: FontScale.scaleSize(context: context),
      child: MaterialApp(
        title: AppTexts.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: RouteConfig.initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
