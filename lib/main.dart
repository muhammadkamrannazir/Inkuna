import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkuna/views/choose_role.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Inkuña',
        theme: ThemeData(
          primaryColor: Colors.red,
          primarySwatch: Colors.red,
          textTheme: Typography.englishLike2021.apply(
            fontSizeFactor: 1.sp,
            // bodyColor: Colors.black,
          ),
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Montserrat',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ChooseRoleScreen(),
      ),
    );
  }
}
