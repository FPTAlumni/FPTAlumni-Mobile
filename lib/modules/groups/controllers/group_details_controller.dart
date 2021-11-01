import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/groups/controllers/your_groups_controller.dart';
import 'package:uni_alumni/modules/groups/group_repository.dart';
import 'package:uni_alumni/shared/widgets/confirm_dialog.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';

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
      // page: _page.toString(),
    );

    List<Group>? _groups =
        await groupRepository.getGroups(_userAuthentication!.appToken, params);
    if (_groups != null) {
      groupChild.value = _groups;
      isGroupChildLoading.value = false;
    }
  }

  Future<bool> leaveGroup() async {
    bool? isConfirmed =
        await ConfirmDialog.showDialog(msg: 'Do you want to leave group?');

    if (isConfirmed == null) {
      return false;
    }

    bool result = await groupRepository.leaveGroup(
        _userAuthentication!.appToken, currentGroup!.id!);
    if (result) {
      //delete this group from my group list
      var yourGroups = Get.find<YourGroupsController>().myGroups;
      int index = yourGroups
          .indexWhere((group) => (group as Group).id == currentGroup!.id);
      if (index < 0) return false;

      yourGroups.removeAt(index);
      yourGroups.refresh();
      return true;
    } else {
      ErrorDialog.showDialog();
      return false;
    }
  }
}
