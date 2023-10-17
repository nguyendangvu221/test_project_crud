import 'package:freezed_annotation/freezed_annotation.dart';
part 'model_district.g.dart';

@JsonSerializable()
class District {
  final String? districtCode;
  final String? provinceCode;
  final String? districtName;
  final String? flagActive;
  District({
    this.districtCode,
    this.districtName,
    this.flagActive,
    this.provinceCode,
  });
  factory District.fromJson(Map<String, dynamic> json) {
    return _$DistrictFromJson(json);
  }
  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
