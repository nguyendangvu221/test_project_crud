import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_project/domain/model_district.dart';
import 'package:flutter_test_project/domain/model_list_province_district.dart';
import 'package:flutter_test_project/domain/model_province.dart';
import 'package:flutter_test_project/presentation/screen_crud_listview/cubit/crud_district_state.dart';

class CRUDDistrictCubit extends Cubit<CRUDDistrictState> {
  CRUDDistrictCubit() : super(_initState());
  static CRUDDistrictState _initState() => CRUDDistrictState(
        listProvinceDistrict: [],
        district: '',
        flagActive: '0',
        listProvinceName: [],
        province: '',
      );
  Future<List<District>> fetchDistrict() async {
    // try {
    String reponse = await rootBundle.loadString('assets/Mst_District.json');
    List<dynamic> jsonList = jsonDecode(reponse);
    return jsonList.map((n) => District.fromJson(n)).toList();
    // } catch (e) {
    //   log(e.toString());
    // }
  }

  List<Map<String, String>> mapProvince = [
    {
      "101": "Thành phố Hà Nội",
    },
    {
      "103": "TP Hải Phòng",
    },
    {
      "107": "Tỉnh Hải Dương",
    },
    {
      "109": "Tỉnh Hưng Yên",
    },
    {
      "111": "Tỉnh Hà Nam",
    },
    {
      "113": "Tỉnh Nam Định",
    },
    {
      "115": "Tỉnh Thái Bình",
    },
    {
      "117": "Tỉnh Ninh Bình",
    },
    {
      "201": "Tỉnh Hà Giang",
    },
    {
      "203": "Tỉnh Cao Bằng",
    },
  ];
  Future<List<Province>> fetchProvince() async {
    // try {
    String reponse = await rootBundle.loadString('assets/Mst_Province.json');
    List<dynamic> jsonList = jsonDecode(reponse);
    List<Province> listProvince = jsonList.map((n) => Province.fromJson(n)).toList();
    for (int i = 0; i < listProvince.length; i++) {}
    return listProvince;
  }

  Future<void> updateListProvince() async {
    final List<Province> listProvince = await fetchProvince();
    List<String> listProvinceName = [];
    for (int i = 0; i < listProvince.length; i++) {
      listProvinceName.add(listProvince[i].provinceName ?? '');
    }
    emit(
      state.copyWith(
        listProvinceName: listProvinceName,
      ),
    );
  }

  void changeFlagActive(String? flagActive) {
    emit(
      state.copyWith(flagActive: flagActive),
    );
  }

  void changeDistrict(String? district) {
    emit(
      state.copyWith(district: district),
    );
  }

  void changeProvince(String? province) {
    emit(
      state.copyWith(
        province: province,
      ),
    );
  }

  void searchPlace({
    required String? pronvince,
    required String? flagActive,
    required String? district,
  }) {
    List<Province> provinces = [];
    List<District> districts = [];
    List<ProvinceDistrict> provinceDistrictList = [];
    if (pronvince!.isEmpty && flagActive!.isEmpty && district!.isEmpty) {
      return;
    }

    if (flagActive!.isEmpty && district!.isEmpty) {
      for (var district in districts) {
        var matchingProvince = provinces.firstWhere(
          (province) => district.provinceCode == province.provinceCode,
        );
        var provinceDistrict = ProvinceDistrict(
          districtCode: district.districtCode,
          districtName: district.districtName,
          provinceCode: matchingProvince.provinceCode,
          provinceName: matchingProvince.provinceName,
          flagActive: matchingProvince.flagActive,
        );
        provinceDistrictList.add(provinceDistrict);
      }
      if (pronvince.isEmpty && district.isEmpty) {
        for (var district in districts) {
          var matchingProvince = provinces.firstWhere(
            (province) => district.provinceCode == province.provinceCode,
          );
          var provinceDistrict = ProvinceDistrict(
            districtCode: district.districtCode,
            districtName: district.districtName,
            provinceCode: district.provinceCode,
            provinceName: matchingProvince.provinceName,
            flagActive: matchingProvince.flagActive,
          );
          provinceDistrictList.add(provinceDistrict);
        }
      }
    }
  }
}
