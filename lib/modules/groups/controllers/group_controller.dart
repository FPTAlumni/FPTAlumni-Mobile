import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/groups/controllers/discover_groups_controller.dart';
import 'package:uni_alumni/modules/groups/group_repository.dart';
import 'package:uni_alumni/modules/groups/controllers/your_groups_controller.dart';

enum GroupTabs {
  yourGroup,
  discover,
}

class GroupController extends GetxController {
  var selectedFilterList = [].obs;

  final GroupRepository groupRepository;

  final userAuthentication = Get.find<AuthController>().userAuthentication;

  GroupController({required this.groupRepository});

  @override
  void onInit() {
    super.onInit();
  }

  Future<Group?> getGroupById(int id) async {
    return await groupRepository.getGroupById(userAuthentication!.appToken, id);
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<YourGroupsController>();
    Get.delete<DiscoverGroupsController>();
  }
}
