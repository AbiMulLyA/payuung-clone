import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exception/failure.dart';
import '../../domain/entity/profile.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasource/local/profile_local_data_source.dart';
import '../model/profile_model.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;

  ProfileRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final profileModel = await localDataSource.getProfile();
      return Right(profileModel.toEntity());
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(Profile profile) async {
    try {
      await localDataSource.updateProfile(ProfileModel.fromEntity(profile));
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
