import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimed/app/config/colors/colors.dart';
import 'package:unimed/app/routers/app_routers.dart';

import '../controller/splash.controller.dart';

class SplashPage extends GetView<SplashController> {
  SplashController ctrl = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ctrl,
        builder: (controller) {
          return Scaffold(
              backgroundColor: AppColor.primary,
              body: SafeArea(
                  child: Center(
                child: Container(
                  child: Image.network(
                      'https://www.unimedjp.com.br/imagens/unimedjoaopessoa.png',
                      width: 150),
                ),
              )));
        });
  }
}
