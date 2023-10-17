import 'package:freezed_annotation/freezed_annotation.dart';
part 'model_province.g.dart';

@JsonSerializable()
class Province {
  final String? provinceCode;
  final String? provinceName;
  final String? flagActive;
  factory Province.fromJson(Map<String, dynamic> json) => _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
  Province({
    this.flagActive,
    this.provinceCode,
    this.provinceName,
  });
}
