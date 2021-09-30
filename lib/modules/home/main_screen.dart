import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/main_controller.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class MainScreen extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(() => _buildWidget(context)),
      onWillPop: () async => false,
    );
  }

  Widget _buildWidget(BuildContext context) {
    return Scaffold(
      body: _buildContent(controller.currentTab.value),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
        unselectedItemColor: ColorConstants.black,
        currentIndex: controller.getCurrentIndex(controller.currentTab.value),
        selectedItemColor: ColorConstants.primaryAppColor,
        selectedLabelStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) => controller.switchTab(index),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildContent(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return controller.homeTab;
      case MainTabs.recruitment:
        return controller.recruitmentsTab;
      case MainTabs.groups:
        return controller.groupsTab;
      case MainTabs.menu:
        return controller.menuTab;
      default:
        return controller.homeTab;
    }
  }

  Widget _homeTabBottomSheet() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Create new News',
                style: TextStyle(color: ColorConstants.primaryAppColor),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Create new Event',
                style: TextStyle(color: ColorConstants.primaryAppColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
