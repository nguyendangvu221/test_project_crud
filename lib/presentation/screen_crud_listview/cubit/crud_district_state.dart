import 'package:flutter_test_project/domain/model_district.dart';
import 'package:flutter_test_project/domain/model_province.dart';

class CRUDDistrictState {
  final List<District>? district;
  final List<Province>? pronvince;
  CRUDDistrictState({
    this.district,
    this.pronvince,
  });
  CRUDDistrictState copyWith({
    List<District>? district,
    List<Province>? pronvince,
  }) {
    return CRUDDistrictState(
      district: district ?? this.district,
      pronvince: pronvince ?? this.pronvince,
    );
  }
}
