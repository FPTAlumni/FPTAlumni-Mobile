import 'package:get/get.dart';
import 'package:uni_alumni/models/request/alumni_group_request.dart';
import 'package:uni_alumni/models/response/alumni_group_response.dart';
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

  final _userAuthentication = Get.find<AuthController>().userAuthentication;
  final _currentUser = Get.find<AuthController>().currentUser;

  GroupController({required this.groupRepository});

  @override
  void onInit() {
    super.onInit();
  }

  // Future<Group?> getGroupById(int id) async {
  //   return await groupRepository.getGroupById(userAuthentication!.appToken, id);
  // }

  Future<bool> isInGroup(int groupId) async {
    AlumniGroupRequest params = AlumniGroupRequest(
      groupId: groupId.toString(),
      email: _currentUser!.email,
    );

    AlumniGroupResponse? response = await groupRepository.getAlumniInGroup(
        _userAuthentication!.appToken, params);

    if (response != null) {
      print(response.toJson());
      return true;
    }
    return false;
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<YourGroupsController>();
    Get.delete<DiscoverGroupsController>();
  }
}
