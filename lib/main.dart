import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/config/app_theme.dart';
import 'app/routers/app_pages.dart';
import 'app/routers/app_routers.dart';

void main() async {
  runApp(GetMaterialApp(
    title: 'Unimed',
    debugShowCheckedModeBanner: false,
    getPages: AppPages.routes,
    initialRoute: Routes.SPLASH,
    theme: appThemeData,
  ));
}
