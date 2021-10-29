import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/modules/groups/controllers/group_child_list_controller.dart';
import 'package:uni_alumni/modules/groups/group_repository.dart';
import 'package:uni_alumni/modules/groups/widgets/groups_list.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class GroupChildListScreen extends StatelessWidget {
  final Group parentGroup;

  GroupChildListScreen(this.parentGroup) {
    Get.put(GroupChildListController(
        groupRepository: GroupRepository(apiProvider: Get.find())));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GroupChildListController>();
    controller.parentGroup = parentGroup;

    return Scaffold(
      appBar: SubScreenAppBar(
        title: '${parentGroup.groupName}\'s groups child',
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.lightPrimaryAppColor,
            ),
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: GestureDetector(
              onTap: () async {
                controller.showGroupFilter();
              },
              child: Container(
                width: 25,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset(
                    'assets/images/filter.png',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: GroupsList(
        list: controller.groupChild,
        scrollController: controller.scrollController,
        onRefresh: controller.refresh,
        isLoading: controller.isLoading,
        isGroupChild: true,
      ),
    );
  }
}
