import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/presentation/screen_crud_listview/cubit/crud_district_state.dart';
import 'package:flutter_test_project/presentation/screen_crud_listview/screen_crud_listview.dart';

import 'screen_crud_listview/cubit/crud_distric_cubit.dart';

class ScreenSelect extends StatelessWidget {
  const ScreenSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Screen Selected',
              ),
            )),
      ),
      body: BlocBuilder<CRUDDistrictCubit, CRUDDistrictState>(
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (state.listProvinceName!.isEmpty) {
                    context.read<CRUDDistrictCubit>().updateListProvince();
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenCRUDListview(
                        pronvinceName: state.province,
                        flagActive: state.flagActive ?? '0',
                        listProvinceDistrict: state.listProvinceDistrict,
                        listProvinceName: state.listProvinceName,
                        onChangedDistrict: (p0) {
                          context.read<CRUDDistrictCubit>().changeDistrict(p0);
                        },
                        onTapDelete: () {},
                        onTapSearch: () {},
                        onChangedCheckBox: (p0) {
                          context.read<CRUDDistrictCubit>().changeFlagActive(
                                p0 ?? false ? '1' : '0',
                              );
                        },
                        selectedProvince: (p0) {
                          context.read<CRUDDistrictCubit>().changeProvince(p0);
                          log(state.province.toString());
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Screen ListView',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Screen Table',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
