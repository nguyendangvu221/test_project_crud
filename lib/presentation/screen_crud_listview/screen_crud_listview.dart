import 'package:flutter/material.dart';
import 'package:flutter_test_project/common/config/check_box.dart';
import 'package:flutter_test_project/common/config/text_input.dart';
import 'package:flutter_test_project/domain/model_list_province_district.dart';
import 'package:flutter_test_project/presentation/screen_crud_listview/screen_add.dart';

class ScreenCRUDListview extends StatelessWidget {
  const ScreenCRUDListview({
    super.key,
    required this.flagActive,
    required this.listProvinceDistrict,
    required this.listProvinceName,
    required this.onChangedDistrict,
    required this.onTapDelete,
    required this.onTapSearch,
    required this.onChangedCheckBox,
    required this.selectedProvince,
    required this.pronvinceName,
  });
  final List<String>? listProvinceName;
  final String? flagActive;
  final String? pronvinceName;
  final List<ProvinceDistrict>? listProvinceDistrict;
  final void Function()? onTapDelete;
  final void Function(String)? onChangedDistrict;
  final void Function()? onTapSearch;
  final void Function(bool?) onChangedCheckBox;
  final void Function(String?)? selectedProvince;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Screen ListView Pronvince',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _selectProvince(
                listProvinceName: listProvinceName,
                onTap: onTapSearch,
                selectedProvince: selectedProvince,
                provinceName: pronvinceName,
              ),
              const SizedBox(
                height: 15,
              ),
              _textFielDistrict(onChanged: onChangedDistrict),
              const SizedBox(
                height: 15,
              ),
              _checkBoxActive(flagActive: flagActive, onChangedCheckBox: onChangedCheckBox),
              const SizedBox(
                height: 15,
              ),
              _cRUD(context),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: listProvinceDistrict?.length,
                  itemBuilder: (context, index) => _displayCardInfo(
                    districtCode: listProvinceDistrict?[index].districtCode,
                    districtName: listProvinceDistrict?[index].districtName,
                    flagActive: listProvinceDistrict?[index].flagActive,
                    provinceCode: listProvinceDistrict?[index].provinceCode,
                    provinceName: listProvinceDistrict?[index].provinceName,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cRUD(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProvince(),
              ),
            );
          },
          child: Container(
            height: 40,
            width: 80,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: const Text(
              'Thêm',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapDelete,
          child: Container(
            height: 40,
            width: 80,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: const Text(
              'Sửa',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapDelete,
          child: Container(
            height: 40,
            width: 80,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: const Text(
              'Xóa',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _displayCardInfo({
    required String? districtCode,
    required String? districtName,
    required String? provinceCode,
    required String? provinceName,
    required String? flagActive,
  }) {
    return Card(
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CustomCheckBox(
            isDisable: false,
            isCheck: true,
            onChanged: (p0) {},
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            children: [
              Text(
                districtName ?? '',
              ),
              Text(districtCode ?? ''),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            children: [
              Text(
                provinceCode ?? '',
              ),
              Text(flagActive == '0' ? 'No Active' : 'Active'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _checkBoxActive({required String? flagActive, required void Function(bool?) onChangedCheckBox}) => Row(
        children: [
          const Text(
            'Trạng thái',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          CustomCheckBox(
            isDisable: false,
            isCheck: flagActive == '0' ? false : true,
            onChanged: onChangedCheckBox,
          )
        ],
      );

  Widget _textFielDistrict({required void Function(String)? onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Quận, Huyện',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          child: CustomTextInput(
            onChanged: onChanged,
            isDisable: false,
            hintText: 'Nhập tên',
          ),
        )
      ],
    );
  }

  Widget _selectProvince({
    required List<String>? listProvinceName,
    required void Function()? onTap,
    required void Function(String?)? selectedProvince,
    required String? provinceName,
  }) {
    return Row(
      children: [
        const Text(
          'Tỉnh, Thành phố',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            height: 30,
            width: double.infinity,
            child: DropdownButton(
              style: const TextStyle(
                color: Colors.black,
              ),
              onChanged: selectedProvince,
              value: provinceName,
              items: listProvinceName?.toSet().toList().map((String province) {
                return DropdownMenuItem<String>(
                  value: province,
                  child: Text(province),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 40,
            width: 80,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: const Text(
              'Tìm kiếm',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        )
      ],
    );
  }
}
