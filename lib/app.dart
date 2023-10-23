import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/presentation/screen_crud_listview/cubit/crud_distric_cubit.dart';
import 'package:flutter_test_project/presentation/screen_crud_listview/screen_crud_listview.dart';
import 'package:flutter_test_project/presentation/screen_select.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          BlocProvider(
            create: (context) => CRUDDistrictCubit(),
            child: const ScreenSelect(),
          )
        ],
        child: const ScreenSelect(),
      ),
    );
  }
}
