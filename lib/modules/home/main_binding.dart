import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
