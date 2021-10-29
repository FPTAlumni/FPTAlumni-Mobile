import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/groups/group_repository.dart';

class GroupDetailsController extends GetxController {
  final GroupRepository groupRepository;

  GroupDetailsController({required this.groupRepository});

  final _userAuthentication = Get.find<AuthController>().userAuthentication;

  static const maxChildGroup = 3;

  Group? currentGroup;

  var groupChild = [].obs;
  var isGroupChildLoading = true.obs;
  int _groupPageSize = maxChildGroup + 1;
  int _page = 1;

  Future? getGroupChild;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getGroupChild = _getGroupChild();
  }

  _getGroupChild() async {
    //only load group child if this is the root parent
    // if (currentGroup!.parentGroup != null) return;
    isGroupChildLoading.value = true;
    print('get group child');
    GroupRequest params = GroupRequest(
      parentGroupId: currentGroup!.id.toString(),
      pageSize: _groupPageSize.toString(),
      page: _page.toString(),
    );

    List<Group>? _groups =
        await groupRepository.getGroups(_userAuthentication!.appToken, params);
    if (_groups != null) {
      groupChild.value = _groups;
      isGroupChildLoading.value = false;
    }
  }
}
