import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/groups/widgets/groups_list.dart';

import '../controllers/your_groups_controller.dart';

class YourGroups extends StatelessWidget {
  final controller = Get.find<YourGroupsController>();

  @override
  Widget build(BuildContext context) {
    return GroupsList(
      list: controller.myGroups,
      key: PageStorageKey('yourGroup'),
      scrollController: controller.scrollController,
      onRefresh: controller.refresh,
      isLoading: controller.isLoading,
    );
  }
}
