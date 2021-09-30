import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/main_binding.dart';
import 'package:uni_alumni/modules/home/main_screen.dart';
import 'package:uni_alumni/modules/news/screens/news_screen.dart';

part './app_routes.dart';

class AppPages {
  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => MainScreen(),
      binding: MainBinding(),
      children: [
        GetPage(
          name: Routes.NEWS,
          page: () => NewsScreen(),
        ),
      ],
    ),
    // GetPage(
    //   name: Routes.NEWS,
    //   page: () => NewsScreen(),
    // ),
  ];
}
