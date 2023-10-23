import 'package:flutter/material.dart';
import 'package:flutter_test_project/common/config/text_input.dart';

class AddProvince extends StatelessWidget {
  const AddProvince({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.blue,
          child: const Text(
            'Screen ADD',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _customTextInput('Mã tỉnh'),
            const SizedBox(
              height: 20,
            ),
            _customTextInput('Tên tỉnh'),
            const SizedBox(
              height: 20,
            ),
            _customTextInput('Mã Quận/Huyện'),
            const SizedBox(
              height: 20,
            ),
            _customTextInput('Tên Quận/Huyện'),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {},
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
          ],
        ),
      ),
    );
  }

  Widget _selectProvinceCode(List<Map<String, String>> listProvinceCode) {
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
        // Flexible(
        //   child: Container(
        //     decoration: const BoxDecoration(
        //       color: Colors.blue,
        //     ),
        //     height: 30,
        //     width: double.infinity,
        //     child: DropdownButton(
        //       style: const TextStyle(
        //         color: Colors.black,
        //       ),
        //       onChanged:(value) {

        //       },
        //       value: listProvinceCode[0].keys.toList().first,
        //       items: listProvinceCode.keys.toList().map((String province) {
        //         return DropdownMenuItem<String>(
        //           value: province,
        //           child: Text(province),
        //         );
        //       }).toList(),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _customTextInput(String? text) {
    return Row(
      children: [
        Expanded(
          child: Text(text ?? ''),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          flex: 2,
          child: CustomTextInput(isDisable: false),
        ),
      ],
    );
  }
}
