// ignore_for_file: unused_element

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payuung_clone/core/config/di/injector.config.dart';
import 'package:sqflite/sqflite.dart';

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

  @preResolve
  Future<Database> get database async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'payuung_database.db');
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE profile(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fullName TEXT,
            birthDate TEXT,
            sex TEXT,
            ktpPath TEXT,
            nik INTEGER,
            ktpAddress TEXT,
            companyName TEXT,
            companyAddress TEXT
          )
        ''');
        // Insert default profile
        await db.insert('profile', {
          'fullName': 'Ahmad Abi Mulya',
          'birthDate': '2001-09-10',
          'sex': 'Male',
          'ktpPath': '',
          'nik': 1234567890123456,
          'ktpAddress': 'Jalan 123 Jakarta',
          'companyName': 'ABC Company',
          'companyAddress': 'Jalan 123 Jakarta',
        });
      },
    );
  }
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
