import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/groups/controllers/discover_groups_controller.dart';

import 'groups_list.dart';

class DiscoverGroups extends StatelessWidget {
  DiscoverGroups({Key? key}) : super(key: key);

  final controller = Get.find<DiscoverGroupsController>();

  @override
  Widget build(BuildContext context) {
    return GroupsList(
      list: controller.discoverGroups,
      key: PageStorageKey('discoverGroup'),
      scrollController: controller.scrollController,
      onRefresh: controller.refresh,
      isLoading: controller.isLoading,
    );
  }
}
