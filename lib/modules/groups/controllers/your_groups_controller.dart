import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/groups/group_repository.dart';

class YourGroupsController extends GetxController {
  final GroupRepository groupRepository;

  YourGroupsController({required this.groupRepository});

  final userAuthentication = Get.find<AuthController>().userAuthentication;

  var myGroups = [].obs;
  final ScrollController scrollController = ScrollController();

  final _pageSize = 6;
  int _page = 1;
  String? error;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getMyGroup();
    scrollController.addListener(() {
      isLoading.value = true;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMyGroup().then((_) {
          if (error != null) {
            isLoading.value = false;
          }
        });
      }
    });
  }

  getMyGroup() async {
    print('Get my group');
    GroupRequest params = GroupRequest(
      alumniId: userAuthentication!.id.toString(),
      parentGroupId: (-1).toString(),
      joined: true.toString(),
      pageSize: _pageSize.toString(),
      page: _page.toString(),
    );

    List<Group?>? _groups =
        await groupRepository.getMyGroup(userAuthentication!.appToken, params);
    if (_groups != null && _groups.isNotEmpty) {
      myGroups.addAll(_groups);
      _page++;
      error = null;
      isLoading.value = true;
      if (myGroups.length < _pageSize) {
        isLoading.value = false;
      }
    } else {
      error = 'There is no group';
    }
  }

  Future<void> refresh() async {
    isLoading.value = false;
    myGroups.value = [];
    _page = 1;
    error = null;
    await getMyGroup();
  }
}
