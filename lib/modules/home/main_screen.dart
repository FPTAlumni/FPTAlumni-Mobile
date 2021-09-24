import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/main_controller.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class MainScreen extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(() => _buildWidget()),
      onWillPop: () async => false,
    );
  }

  Widget _buildWidget() {
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
            icon: Icon(Icons.person),
            label: 'Me',
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
      case MainTabs.Home:
        return controller.homeTab;
      case MainTabs.Recruitment:
        return controller.recruitmentsTab;
      case MainTabs.Groups:
        return controller.groupsTab;
      case MainTabs.Me:
        return controller.meTab;
      default:
        return controller.homeTab;
    }
  }
}
