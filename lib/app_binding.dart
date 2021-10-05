import 'package:get/get.dart';
import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/modules/auth/auth_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider(), permanent: true);
    Get.put(AuthRepository(apiProvider: Get.find()), permanent: true);
  }
}
