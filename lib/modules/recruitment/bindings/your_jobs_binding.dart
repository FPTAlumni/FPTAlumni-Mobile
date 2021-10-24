import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/controllers/your_jobs_controller.dart';

import '../recruitment_repository.dart';

class YourJobsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => YourJobsController(
        recruitmentRepository: RecruitmentRepository(apiProvider: Get.find())));
  }
}
