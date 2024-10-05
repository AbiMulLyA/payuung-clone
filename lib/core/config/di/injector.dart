// ignore_for_file: unused_element

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:payuung_clone/core/config/di/injector.config.dart';

import '../router/router.dart';

final getIt = GetIt.instance;

//* Initial Getit
@injectableInit
configureConfigInjector() => getIt.init();

//* For ThirdParty Plugins
@module
abstract class RegisterModule {
  @singleton
  AppRouter get appRouter => AppRouter();
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
