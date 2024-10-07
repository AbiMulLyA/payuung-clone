import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exception/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/profile.dart';
import '../repository/profile_repository.dart';

@injectable
class UpdateProfile implements UseCase<void, Profile> {
  final ProfileRepository repository;

  UpdateProfile(this.repository);

  @override
  Future<Either<Failure, void>> call(Profile profile) async {
    return await repository.updateProfile(profile);
  }
}
