import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/profile.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required int id,
    required String fullName,
    required String birthDate,
    required String sex,
    required String ktpPath,
    required int nik,
    required String companyName,
    required String companyAddress,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  factory ProfileModel.fromEntity(Profile profile) => ProfileModel(
        id: profile.id,
        fullName: profile.fullName,
        birthDate: profile.birthDate,
        sex: profile.sex,
        ktpPath: profile.ktpPath,
        nik: profile.nik,
        companyName: profile.companyName,
        companyAddress: profile.companyAddress,
      );
}

extension ProfileModelX on ProfileModel {
  Profile toEntity() => Profile(
        id: id,
        fullName: fullName,
        birthDate: birthDate,
        sex: sex,
        ktpPath: ktpPath,
        nik: nik,
        companyName: companyName,
        companyAddress: companyAddress,
      );
}
