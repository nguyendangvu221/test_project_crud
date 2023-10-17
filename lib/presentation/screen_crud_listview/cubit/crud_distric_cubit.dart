import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_project/domain/model_district.dart';
import 'package:flutter_test_project/domain/model_province.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_test_project/domain/model_district.dart';
import 'package:flutter_test_project/presentation/screen_crud_listview/cubit/crud_district_state.dart';

class CRUDDistrictCubit extends Cubit<CRUDDistrictState> {
  CRUDDistrictCubit() : super(_initState());
  static CRUDDistrictState _initState() => CRUDDistrictState(district: [], pronvince: []);
  Future<List<District>> fetchDistrict() async {
    // try {
    String reponse = await rootBundle.loadString('assets/Mst_District.json');
    List<dynamic> jsonList = jsonDecode(reponse);
    return jsonList.map((n) => District.fromJson(n)).toList();
    // } catch (e) {
    //   log(e.toString());
    // }
  }

  Future<List<Province>> fetchProvince() async {
    // try {
    String reponse = await rootBundle.loadString('assets/Mst_Province.json');
    List<dynamic> jsonList = jsonDecode(reponse);
    List<Province> listProvince = jsonList.map((n) => Province.fromJson(n)).toList();
    for (int i = 0; i < listProvince.length; i++) {
      log(listProvince[i].provinceCode.toString());
      log(listProvince[i].provinceName.toString());
      log(listProvince[i].flagActive.toString());
    }
    return listProvince;
    // } catch (e) {
    //   log(e.toString());
    // }
  }

  Future<void> updateListDistrict() async {
    emit(
      state.copyWith(
        district: await fetchDistrict(),
      ),
    );
  }

  Future<void> updateListProvince() async {
    emit(
      state.copyWith(
        pronvince: await fetchProvince(),
      ),
    );
  }
}
