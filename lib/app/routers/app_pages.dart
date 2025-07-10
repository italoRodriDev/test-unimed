import 'package:get/get.dart';
import 'package:unimed/app/modules/detail/view/detail.page.dart';
import 'package:unimed/app/modules/favorites/view/favorites.page.dart';
import 'package:unimed/app/routers/app_routers.dart';

import '../modules/home/view/home.page.dart';
import '../modules/splash/view/splash.page.dart';

const animation = Transition.circularReveal;
const timeAnimation = 300;

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
    GetPage(
      name: Routes.FAVORITES,
      page: () => FavoritesPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
  ];
}
