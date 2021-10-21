import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_crud_controller.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_repository.dart';

class RecruitmentCrudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecruitmentCrudController(
        recruitmentRepository: RecruitmentRepository(apiProvider: Get.find())));
  }
}
