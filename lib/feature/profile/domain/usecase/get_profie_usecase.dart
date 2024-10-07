import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exception/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/profile.dart';
import '../repository/profile_repository.dart';

@injectable
class GetProfile implements UseCase<Profile, NoParams> {
  final ProfileRepository repository;

  GetProfile(this.repository);

  @override
  Future<Either<Failure, Profile>> call(NoParams params) async {
    return await repository.getProfile();
  }
}
