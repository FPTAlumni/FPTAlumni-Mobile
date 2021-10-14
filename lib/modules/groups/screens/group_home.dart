import 'package:flutter/material.dart';
import 'package:uni_alumni/modules/groups/group_controller.dart';
import 'package:uni_alumni/modules/groups/widgets/groups_list.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class GroupHome extends StatelessWidget {
  final GroupController controller = Get.put(GroupController());
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = SubScreenAppBar(
      title: "Groups",
      // actions: [
      //   Container(
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: ColorConstants.lightPrimaryAppColor,
      //     ),
      //     padding: const EdgeInsets.all(8.0),
      //     margin: const EdgeInsets.only(
      //       right: 10,
      //     ),
      //     child: GestureDetector(
      //       onTap: () async {},
      //       child: Container(
      //         width: 25,
      //         child: AspectRatio(
      //           aspectRatio: 1 / 1,
      //           child: Image.asset(
      //             'assets/images/filter.png',
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
    );

    PreferredSizeWidget chipTab = PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            return _buildChip(
                label: 'Your groups',
                icon: Icons.group,
                tab: GroupTabs.yourGroup);
          }),
          const SizedBox(width: 10.0),
          Obx(() {
            return _buildChip(
                label: 'Discover',
                icon: Icons.whatshot_rounded,
                tab: GroupTabs.discover);
          }),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: appBar,
      body: Column(
        children: [
          chipTab,
          Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                appBar.preferredSize.height -
                chipTab.preferredSize.height -
                kBottomNavigationBarHeight,
            child: GroupsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
      {required String label, required IconData icon, required GroupTabs tab}) {
    return ActionChip(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      label: Text(label),
      avatar: Icon(
        icon,
        color: controller.selectedTab.value == controller.getTabIndex(tab)
            ? Colors.white
            : Colors.black,
      ),
      backgroundColor:
          controller.selectedTab.value == controller.getTabIndex(tab)
              ? ColorConstants.lightPrimaryAppColor
              : Colors.grey[300],
      labelStyle: TextStyle(
        color: controller.selectedTab.value == controller.getTabIndex(tab)
            ? Colors.white
            : Colors.black,
      ),
      onPressed: () {
        controller.onChangeTab(tab);
      },
    );
  }
}
