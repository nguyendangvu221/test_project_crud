import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/common/config/check_box.dart';
import 'package:flutter_test_project/common/config/text_input.dart';
import 'package:flutter_test_project/domain/model_district.dart';
import 'package:flutter_test_project/domain/model_province.dart';
import 'package:flutter_test_project/presentation/screen_crud_listview/cubit/crud_distric_cubit.dart';
import 'package:flutter_test_project/presentation/screen_crud_listview/cubit/crud_district_state.dart';

class ScreenCRUDListview extends StatelessWidget {
  ScreenCRUDListview({super.key});
  List<int> testDropdown = [
    1,
    2,
    3,
    4,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CRUDDistrictCubit, CRUDDistrictState>(
        builder: (context, state) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
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
                _selectProvince(),
                const SizedBox(
                  height: 15,
                ),
                _textFielDistrict(),
                const SizedBox(
                  height: 15,
                ),
                _checkBoxActive(),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CRUDDistrictCubit>().fetchProvince();
                  },
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
                const SizedBox(
                  height: 30,
                ),
                ListView.builder(
                  itemBuilder: (context, index) => _displayCardInfo(
                    district: state.district?[index],
                    province: state.pronvince?[index],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayCardInfo({District? district, Province? province}) {
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
                district?.districtName ?? '',
              ),
              Text(district?.districtCode ?? ''),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            children: [
              Text(
                district?.provinceCode ?? '',
              ),
              Text(district?.flagActive == '0' ? 'No Active' : 'Active'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _checkBoxActive() => Row(
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
            isCheck: true,
            onChanged: (p0) {},
          )
        ],
      );

  Widget _textFielDistrict() {
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
            isDisable: false,
            hintText: 'Nhập tên',
          ),
        )
      ],
    );
  }

  Widget _selectProvince({List<Province>? pronvince, int? index}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Tỉnh, Thành phố',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        // const SizedBox(
        //   width: 20,
        // ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          height: 30,
          width: 70,
          child: DropdownButton(
            style: const TextStyle(
              color: Colors.black,
            ),
            onChanged: (value) {},
            value: pronvince?[0].provinceName,
            items: (pronvince?[index ?? 0] ?? []).map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        // const SizedBox(
        //   width: 15,
        // ),
        GestureDetector(
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
