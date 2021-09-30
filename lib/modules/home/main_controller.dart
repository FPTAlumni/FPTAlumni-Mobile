import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart';

class MainController extends GetxController {
  var currentTab = MainTabs.home.obs;

  late HomeTab homeTab;
  late RecruitmentTab recruitmentsTab;
  late GroupsTab groupsTab;
  late MenuTab menuTab;

  @override
  void onInit() {
    super.onInit();
    homeTab = HomeTab();

    recruitmentsTab = RecruitmentTab();
    groupsTab = GroupsTab();
    menuTab = MenuTab();
  }

  void switchTab(index) {
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.recruitment:
        return 1;
      case MainTabs.groups:
        return 2;
      case MainTabs.menu:
        return 3;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.recruitment;
      case 2:
        return MainTabs.groups;
      case 3:
        return MainTabs.menu;
      default:
        return MainTabs.home;
    }
  }
}
