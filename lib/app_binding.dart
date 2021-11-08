import 'package:get/get.dart';
import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/modules/alumni/alumni_repository.dart';
import 'package:uni_alumni/modules/alumni/profile_edit_controller.dart';
import 'package:uni_alumni/modules/auth/auth_repository.dart';
import 'package:uni_alumni/modules/company/company_repository.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/modules/groups/controllers/discover_groups_controller.dart';
import 'package:uni_alumni/modules/groups/controllers/group_controller.dart';
import 'package:uni_alumni/modules/groups/group_repository.dart';
import 'package:uni_alumni/modules/home/main_controller.dart';
import 'package:uni_alumni/modules/refferal/referral_repository.dart';
import 'package:uni_alumni/modules/recruitment/controllers/recruitment_tab_controller.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_repository.dart';
import 'package:uni_alumni/modules/voucher/voucher_repository.dart';

import 'modules/alumni/alumni_controller.dart';
import 'modules/events/event_repository.dart';
import 'modules/groups/controllers/your_groups_controller.dart';
import 'modules/home/controllers/home_controller.dart';
import 'modules/news/news_controller.dart';
import 'modules/news/news_repository.dart';
import 'modules/refferal/referral_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider(), permanent: true);
    Get.put(AuthRepository(apiProvider: Get.find()), permanent: true);
    Get.put(EventRepository(apiProvider: Get.find()), permanent: true);
    Get.put(GroupRepository(apiProvider: Get.find()), permanent: true);
    Get.put(NewsRepository(apiProvider: Get.find()), permanent: true);
    Get.put(RecruitmentRepository(apiProvider: Get.find()), permanent: true);
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(
        () => NewsController(newsRepository: Get.find<NewsRepository>()),
        fenix: true);
    Get.lazyPut(
        () => EventController(eventRepository: Get.find<EventRepository>()),
        fenix: true);
    Get.lazyPut(
        () => RecruitmentTabController(
            recruitmentRepository: Get.find<RecruitmentRepository>()),
        fenix: true);
    Get.lazyPut(
        () => GroupController(groupRepository: Get.find<GroupRepository>()),
        fenix: true);
    Get.lazyPut(
        () =>
            YourGroupsController(groupRepository: Get.find<GroupRepository>()),
        fenix: true);
    Get.lazyPut(
        () => DiscoverGroupsController(
            groupRepository: Get.find<GroupRepository>()),
        fenix: true);
    Get.lazyPut(
        () => ReferralController(
            referralRepository: ReferralRepository(apiProvider: Get.find()),
            voucherRepository: VoucherRepository(apiProvider: Get.find())),
        fenix: true);
    Get.lazyPut(
        () => AlumniController(
              alumniRepository: AlumniRepository(apiProvider: Get.find()),
              companyRepository: CompanyRepository(apiProvider: Get.find()),
            ),
        fenix: true);
    Get.lazyPut(
        () => ProfileEditController(
              alumniRepository: AlumniRepository(apiProvider: Get.find()),
              companyRepository: CompanyRepository(apiProvider: Get.find()),
            ),
        fenix: true);
  }
}
