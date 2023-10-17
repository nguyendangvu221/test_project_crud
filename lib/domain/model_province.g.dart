// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      flagActive: json['FlagActive'] as String?,
      provinceCode: json['ProvinceCode'] as String?,
      provinceName: json['ProvinceName'] as String?,
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'provinceCode': instance.provinceCode,
      'provinceName': instance.provinceName,
      'flagActive': instance.flagActive,
    };
