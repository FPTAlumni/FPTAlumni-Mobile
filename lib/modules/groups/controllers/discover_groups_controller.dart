import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';

import '../group_repository.dart';

class DiscoverGroupsController extends GetxController {
  final GroupRepository groupRepository;

  DiscoverGroupsController({required this.groupRepository});

  final userAuthentication = Get.find<AuthController>().userAuthentication;

  var discoverGroups = [].obs;
  final ScrollController scrollController = ScrollController();

  final _pageSize = 6;
  int _page = 1;
  String? error;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getDiscoverGroup();
    scrollController.addListener(() {
      isLoading.value = true;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getDiscoverGroup().then((_) {
          if (error != null) {
            isLoading.value = false;
          }
        });
      }
    });
  }

  getDiscoverGroup() async {
    print('Get discover group');
    GroupRequest params = GroupRequest(
      alumniId: userAuthentication!.id.toString(),
      parentGroupId: (-1).toString(),
      joined: false.toString(),
      pageSize: _pageSize.toString(),
      page: _page.toString(),
    );

    List<Group?>? _groups =
        await groupRepository.getMyGroup(userAuthentication!.appToken, params);
    if (_groups != null && _groups.isNotEmpty) {
      discoverGroups.addAll(_groups);
      _page++;
      error = null;
      isLoading.value = true;
      if (discoverGroups.length < _pageSize) {
        isLoading.value = false;
      }
    } else {
      error = 'There is no group';
    }
  }

  Future<void> refresh() async {
    isLoading.value = false;
    discoverGroups.value = [];
    _page = 1;
    error = null;
    await getDiscoverGroup();
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
      int index = discoverGroups.indexWhere((group) => group.id == groupId);
      if (join) {
        (discoverGroups[index] as Group).joinGroup();
      } else {
        (discoverGroups[index] as Group).cancelJoinGroup();
      }
      discoverGroups.refresh();
    } else {
      ErrorDialog.showDialog();
    }
  }
}
