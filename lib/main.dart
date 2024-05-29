import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/providers/bloc_providers.dart';
import 'package:shoesly/di_injection/get_di_init.dart';

import 'core/app/constants/app_texts.dart';
import 'core/app/theme/app_theme.dart';
import 'core/routes/route_config.dart';
import 'core/routes/route_generator.dart';
import 'core/utils/font_scale.dart';
import 'di_injection/di_init.dart';
import 'firebase_options.dart';

void main() async {
  await initServices();
  runApp(const ShoeslyApp());
}

initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initDependencies();
  firebaseService.firebaseInstance.settings =
      const Settings(persistenceEnabled: true);
}

class ShoeslyApp extends StatelessWidget {
  const ShoeslyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.blocProviders,
      child: MediaQuery(
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
      ),
    );
  }
}
