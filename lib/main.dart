import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:french_conjugation_learn/presentation/routing/main_go_router.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:logger/logger.dart';

import 'data/DI/configure_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await configureDependencies();

  runApp(
    HookedBlocConfigProvider(
      injector: () => getIt.get,
      builderCondition: (state) => state is BuildState,
      child: EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'French Verb Learn',
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          CustomAppTheme.lightTheme,
        ],
      ),
    );
  }
}

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);
