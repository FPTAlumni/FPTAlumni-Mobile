import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/main_controller.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class MainScreen extends StatelessWidget {
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(() => _buildWidget(context)),
      onWillPop: () async {
        // if (Get.previousRoute == Routes.SIGN_IN ||
        //     Get.previousRoute == Routes.SIGN_UP) {
        //   return false;
        // }
        return !await Navigator.maybePop(
          controller.myKeys
              .getKeys()[
                  controller.getCurrentIndex(controller.currentTab.value)]
              .currentState!
              .context,
        );
      },
    );
  }

  Widget _buildWidget(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: controller.getCurrentIndex(controller.currentTab.value),
        children: controller.pages,
      ),
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
            icon: Icon(Icons.assignment_ind),
            label: 'Referral',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Profile',
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
      case MainTabs.referral:
        return controller.referralTab;
      case MainTabs.profile:
        return controller.menuTab;
      default:
        return controller.homeTab;
    }
  }
}
