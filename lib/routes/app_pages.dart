import 'package:get/get.dart';
import 'package:uni_alumni/modules/auth/auth_binding.dart';
import 'package:uni_alumni/modules/auth/screens/sign_in_screen.dart';
import 'package:uni_alumni/modules/auth/screens/sign_up_screen.dart';
import 'package:uni_alumni/modules/home/main_binding.dart';
import 'package:uni_alumni/modules/home/main_screen.dart';
import 'package:uni_alumni/root_app.dart';
part './app_routes.dart';

class AppPages {
  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => RootApp(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
  ];
}
