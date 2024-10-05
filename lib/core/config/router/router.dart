import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/home/presentation/ui/home_page.dart';
import '../../../feature/profile/presentation/ui/profile_page.dart';
import '../../../feature/profile/presentation/ui/profile_personal_information_page.dart';

part 'router.gr.dart';

GlobalKey<NavigatorState> routerNavigator = GlobalKey<NavigatorState>();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  AppRouter() : super(navigatorKey: routerNavigator);
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
    ),
    AutoRoute(
      page: ProfileRoute.page,
    ),
    AutoRoute(
      page: ProfilePersonalInformationRoute.page,
    ),
  ];
}
