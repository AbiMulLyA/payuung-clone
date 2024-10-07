import 'package:dartz/dartz.dart';
import '../../../../core/exception/failure.dart';
import '../entity/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
  Future<Either<Failure, void>> updateProfile(Profile profile);
}
