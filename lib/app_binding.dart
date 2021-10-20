import 'package:get/get.dart';
import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/modules/auth/auth_repository.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/modules/groups/group_controller.dart';
import 'package:uni_alumni/modules/groups/group_repository.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_controller.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_repository.dart';

import 'modules/events/event_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider(), permanent: true);
    Get.put(AuthRepository(apiProvider: Get.find()), permanent: true);
    Get.lazyPut(
        () => GroupController(
            groupRepository: GroupRepository(apiProvider: Get.find())),
        fenix: true);
    Get.lazyPut(
        () => EventController(
            eventRepository: EventRepository(apiProvider: Get.find())),
        fenix: true);
    Get.lazyPut(
        () => RecruitmentController(
            recruitmentRepository:
                RecruitmentRepository(apiProvider: Get.find())),
        fenix: true);
  }
}
