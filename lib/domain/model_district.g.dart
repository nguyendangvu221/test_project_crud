// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      districtCode: json['DistrictCode'] as String?,
      districtName: json['DistrictName'] as String?,
      flagActive: json['FlagActive'] as String?,
      provinceCode: json['ProvinceCode'] as String?,
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'districtCode': instance.districtCode,
      'provinceCode': instance.provinceCode,
      'districtName': instance.districtName,
      'flagActive': instance.flagActive,
    };
