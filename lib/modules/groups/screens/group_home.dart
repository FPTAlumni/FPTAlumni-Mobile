import 'package:flutter/material.dart';
import 'package:uni_alumni/modules/groups/group_controller.dart';
import 'package:uni_alumni/modules/groups/tabs/group_tab_controller.dart';
import 'package:uni_alumni/modules/groups/widgets/groups_list.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class GroupHome extends StatelessWidget {
  final GroupController controller = Get.find<GroupController>();
  final _groupTabs = Get.put(GroupTabController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: SubScreenAppBar(
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
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        // _buildChipsRow(),
        _buildTabBar(context),
        _buildContent(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.75,
        child: TabBarView(
          controller: _groupTabs.controller,
          children: [
            GroupsList(),
            GroupsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        child: TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.redAccent,
          indicatorSize: TabBarIndicatorSize.label,
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          indicatorPadding: const EdgeInsets.symmetric(vertical: 5.0),
          indicator: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.orangeAccent]),
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent),
          controller: _groupTabs.controller,
          tabs: _groupTabs.groupTabs,
        ),
      ),
    );
  }
}
