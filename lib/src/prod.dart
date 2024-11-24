

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gstock/src/utils/theme_utils.dart';
// ignore: unused_import
import 'package:gstock/src/views/admin/Home_views.dart';
// ignore: unused_import
import 'package:gstock/src/views/splashScreen_view.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:
        (context , child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeUtils.light,
            home:SplashScreen(),
          );
        }
      )
    ;
  }
}