import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required int id,
    required String fullName,
    required String birthDate,
    required String sex,
    required String ktpPath,
    required int nik,
    required String ktpAddress,
    required String companyName,
    required String companyAddress,
  }) = _Profile;
}
