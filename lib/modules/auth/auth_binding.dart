import 'package:get/get.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/universities/university_controller.dart';
import 'package:uni_alumni/modules/universities/university_repository.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => UniversityController(
        universityRepository: UniversityRepository(apiProvider: Get.find())));
  }
}
