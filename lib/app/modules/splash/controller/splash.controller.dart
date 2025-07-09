import 'package:get/get.dart';

import '../../../routers/app_routers.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    counterNextPage();
    super.onInit();
  }

  counterNextPage() {
    Future.delayed(const Duration(seconds: 3)).then((d) {
      Get.toNamed(Routes.HOME);
    });
  }
}
