import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
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

  ///This function will check if this alumni in group or not
  ///
  /// Return null if this alumni is not in group
  ///
  /// Return [AlumniGroupResponse] if this alumni is in AlumniGroup table
  Future<AlumniGroupResponse?> isInGroup(int groupId) async {
    AlumniGroupRequest params = AlumniGroupRequest(
      groupId: groupId.toString(),
      email: _currentUser!.email,
    );

    AlumniGroupResponse? alumni = await groupRepository.getAlumniInGroup(
        _userAuthentication!.appToken, params);

    return alumni;
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<YourGroupsController>();
    Get.delete<DiscoverGroupsController>();
  }
}
