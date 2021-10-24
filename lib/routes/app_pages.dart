import 'package:get/get.dart';
import 'package:uni_alumni/modules/auth/auth_binding.dart';
import 'package:uni_alumni/modules/auth/screens/sign_in_screen.dart';
import 'package:uni_alumni/modules/auth/screens/sign_up_screen.dart';
import 'package:uni_alumni/modules/home/main_binding.dart';
import 'package:uni_alumni/modules/home/main_screen.dart';
import 'package:uni_alumni/modules/recruitment/bindings/recruitment_crud_binding.dart';
import 'package:uni_alumni/modules/recruitment/bindings/your_jobs_binding.dart';
import 'package:uni_alumni/modules/recruitment/screen/recruitment_crud.dart';
import 'package:uni_alumni/modules/recruitment/screen/your_jobs_screen.dart';
import 'package:uni_alumni/root_app.dart';
part './app_routes.dart';

class AppPages {
  static const INITIAL = Routes.root;

  static final routes = [
    GetPage(
      name: Routes.root,
      page: () => RootApp(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.main,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => SignInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.recruitmentForm,
      page: () => RecruitmentCrud(),
      binding: RecruitmentCrudBinding(),
    ),
    GetPage(
      name: Routes.yourRecruitment,
      page: () => YourJobsScreen(),
      binding: YourJobsBinding(),
    ),
  ];
}
