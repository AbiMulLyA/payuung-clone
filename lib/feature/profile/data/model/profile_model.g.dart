// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      id: (json['id'] as num).toInt(),
      fullName: json['fullName'] as String,
      birthDate: json['birthDate'] as String,
      sex: json['sex'] as String,
      ktpPath: json['ktpPath'] as String,
      nik: (json['nik'] as num).toInt(),
      companyName: json['companyName'] as String,
      companyAddress: json['companyAddress'] as String,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'birthDate': instance.birthDate,
      'sex': instance.sex,
      'ktpPath': instance.ktpPath,
      'nik': instance.nik,
      'companyName': instance.companyName,
      'companyAddress': instance.companyAddress,
    };
