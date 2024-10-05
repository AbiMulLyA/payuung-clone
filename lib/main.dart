import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'core/config/di/injector.dart';
import 'core/config/router/router.dart';

void main() async {
  await configureConfigInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Payuung Clone',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.amber,
      ),
      builder: (context, child) => child!,
    );
  }
}
