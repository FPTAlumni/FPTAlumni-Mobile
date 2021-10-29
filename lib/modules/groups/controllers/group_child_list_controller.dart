import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';

import '../group_repository.dart';

class GroupChildListController extends GetxController {
  final GroupRepository groupRepository;

  GroupChildListController({required this.groupRepository});

  final userAuthentication = Get.find<AuthController>().userAuthentication;

  Group? parentGroup;
  var groupChild = [].obs;
  final ScrollController scrollController = ScrollController();

  final _pageSize = 8;
  int _page = 1;
  String? error;
  var isLoading = true.obs;

  var _joined = 0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      isLoading.value = true;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getGroupChild().then((_) {
          if (error != null) {
            isLoading.value = false;
          }
        });
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    getGroupChild();
  }

  bool? _getJoinedValue() {
    switch (_joined.value) {
      case 0:
        return null;
      case 1:
        return true;
      case -1:
        return false;
    }
  }

  GroupRequest _generateParams() {
    bool? joined = _getJoinedValue();

    return GroupRequest(
      alumniId: joined == null ? null : userAuthentication!.id.toString(),
      parentGroupId: parentGroup!.id.toString(),
      joined: joined == null ? null : joined.toString(),
      pageSize: _pageSize.toString(),
      page: _page.toString(),
    );
  }

  getGroupChild() async {
    print('Get group child');
    GroupRequest params = _generateParams();
    print(params.toJson());

    List<Group?>? _groups =
        await groupRepository.getGroups(userAuthentication!.appToken, params);
    if (_groups != null && _groups.isNotEmpty) {
      groupChild.addAll(_groups);
      _page++;
      error = null;
      isLoading.value = true;
      if (groupChild.length < _pageSize) {
        isLoading.value = false;
      }
    } else {
      error = 'There is no group child';
    }
  }

  Future<void> refresh() async {
    isLoading.value = false;
    groupChild.value = [];
    _page = 1;
    error = null;
    await getGroupChild();
  }

  toggleRequestJoinGroup(int groupId, {bool join = true}) async {
    bool result = false;

    if (join) {
      result = await groupRepository.joinGroup(
          userAuthentication!.appToken, groupId);
    } else {
      result = await groupRepository.cancelJoinRequest(
          userAuthentication!.appToken, groupId);
    }

    if (result) {
      int index = groupChild.indexWhere((group) => group.id == groupId);
      if (join) {
        (groupChild[index] as Group).joinGroup();
      } else {
        (groupChild[index] as Group).cancelJoinGroup();
      }
      groupChild.refresh();
    } else {
      ErrorDialog.showDialog();
    }
  }

  showGroupFilter() {
    int? oldResult = _joined.value;
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Group Filters',
      actions: [
        TextButton(
          onPressed: () async {
            _joined.value = 0;
            Get.back();
            await refresh();
          },
          child: Text('Clear'),
        ),
        TextButton(
          onPressed: () {
            _joined.value = oldResult;
            Get.back();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
            await refresh();
          },
          child: Text(
            'Choose',
            style: TextStyle(color: ColorConstants.primaryAppColor),
          ),
        ),
      ],
      content: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Joined group'),
              leading: Radio(
                activeColor: ColorConstants.primaryAppColor,
                groupValue: _joined.value,
                onChanged: (int? value) {
                  _joined.value = value!;
                },
                value: 1,
              ),
            ),
            ListTile(
              title: Text('Not joined group'),
              leading: Radio(
                activeColor: ColorConstants.primaryAppColor,
                groupValue: _joined.value,
                onChanged: (int? value) {
                  _joined.value = value!;
                },
                value: -1,
              ),
            ),
          ],
        );
      }),
    );
  }
}
