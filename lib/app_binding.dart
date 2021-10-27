import 'package:get/get.dart';
import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/modules/auth/auth_repository.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/modules/groups/group_controller.dart';
import 'package:uni_alumni/modules/groups/group_repository.dart';
import 'package:uni_alumni/modules/refferal/referral_repository.dart';
import 'package:uni_alumni/modules/recruitment/controllers/recruitment_tab_controller.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_repository.dart';
import 'package:uni_alumni/modules/voucher/voucher_repository.dart';

import 'modules/events/event_repository.dart';
import 'modules/refferal/referral_controller.dart';

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
        () => RecruitmentTabController(
            recruitmentRepository:
                RecruitmentRepository(apiProvider: Get.find())),
        fenix: true);
    Get.lazyPut(
        () => ReferralController(
            referralRepository: ReferralRepository(apiProvider: Get.find()),
            voucherRepository:VoucherRepository(apiProvider: Get.find())),
        fenix: true);
  }
}
