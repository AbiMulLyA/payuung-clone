// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:payuung_clone/core/config/di/injector.dart' as _i1037;
import 'package:payuung_clone/core/config/router/router.dart' as _i202;
import 'package:payuung_clone/core/util/image_util.dart' as _i551;
import 'package:payuung_clone/feature/profile/data/datasource/local/profile_local_data_source.dart'
    as _i700;
import 'package:payuung_clone/feature/profile/data/reposiitory_impl/profile_repository_impl.dart'
    as _i176;
import 'package:payuung_clone/feature/profile/domain/repository/profile_repository.dart'
    as _i1000;
import 'package:payuung_clone/feature/profile/domain/usecase/get_profie_usecase.dart'
    as _i648;
import 'package:payuung_clone/feature/profile/domain/usecase/update_profile_usecase.dart'
    as _i722;
import 'package:payuung_clone/feature/profile/presentation/cubit/profile_cubit.dart'
    as _i572;
import 'package:sqflite/sqflite.dart' as _i779;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i779.Database>(
      () => registerModule.database,
      preResolve: true,
    );
    gh.singleton<_i202.AppRouter>(() => registerModule.appRouter);
    gh.lazySingleton<_i551.ImageUtil>(() => _i551.ImageUtil());
    gh.factory<_i700.ProfileLocalDataSource>(
        () => _i700.ProfileLocalDataSourceImpl(gh<_i779.Database>()));
    gh.factory<_i1000.ProfileRepository>(
        () => _i176.ProfileRepositoryImpl(gh<_i700.ProfileLocalDataSource>()));
    gh.factory<_i648.GetProfile>(
        () => _i648.GetProfile(gh<_i1000.ProfileRepository>()));
    gh.factory<_i722.UpdateProfile>(
        () => _i722.UpdateProfile(gh<_i1000.ProfileRepository>()));
    gh.factory<_i572.ProfileCubit>(() => _i572.ProfileCubit(
          gh<_i648.GetProfile>(),
          gh<_i722.UpdateProfile>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i1037.RegisterModule {}
