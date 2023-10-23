import 'package:flutter_test_project/domain/model_list_province_district.dart';

class CRUDDistrictState {
  final List<ProvinceDistrict>? listProvinceDistrict;
  final List<String>? listProvinceName;
  final String? district;
  final String? flagActive;
  final String? province;
  CRUDDistrictState({
    this.listProvinceDistrict,
    this.district,
    this.flagActive,
    this.listProvinceName,
    this.province,
  });
  CRUDDistrictState copyWith(
      {List<ProvinceDistrict>? listProvinceDistrict,
      List<String>? listProvinceName,
      String? district,
      String? flagActive,
      String? province}) {
    return CRUDDistrictState(
      listProvinceDistrict: listProvinceDistrict ?? this.listProvinceDistrict,
      district: district ?? this.district,
      flagActive: flagActive ?? this.flagActive,
      listProvinceName: listProvinceName ?? this.listProvinceName,
      province: province ?? this.province,
    );
  }
}
